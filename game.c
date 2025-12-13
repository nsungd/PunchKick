#include "game.h"
#include "gba.h"
#include "stage1Collision.h"
#include "sprites.h"
#include "attacks.h"
#include "analogSound.h"
#include "digitalSound.h"
#include "hit.h"
#include "block.h"
#include "mode0.h"
#include "stdlib.h"
#include "time.h"

#include "changmoSheet.h"
#include "gingerSheet.h"
#include "neonSheet.h"
#include "nujaSheet.h"
#include "dummySheet.h"

PLAYER player;
PLAYER opp;

enum direction DIRECTION;

int hOff;
int frameCounter;
int damagedFrames;
int attackCooldown;

void initGame() {
    //Player attributes
    player.x = 160;
    player.y = 96;
    player.xVel = 1;
    player.yVel = 2;
    player.width = 16;
    player.height = 32;
    player.health = 1100;
    player.direction = RIGHT;
    player.attacking = 0;
    player.currentAttack = 0;
    player.oamIndex = 0;
    player.character = CHANGMO;
    player.inAir = 0;
    
    player.walkTime = 10;
    player.currentWalkFrame = 0;

    //opp attributes
    opp.x = 224;
    opp.y = 96;
    opp.xVel = 1;
    opp.yVel = 2;
    opp.width = 16;
    opp.height = 32;
    opp.health = 1100;
    opp.direction = LEFT;
    opp.attacking = 0;
    opp.currentAttack = 0;
    opp.oamIndex = 1;
    opp.inAir = 0;
    
    opp.walkTime = 10;
    opp.currentWalkFrame = 0;
}

void changeCharacters() {
    if (player.character == CHANGMO) {
        player.movelist = changmoMovelist;
        DMANow(3, changmoSheetTiles, &CHARBLOCK[4], changmoSheetTilesLen / 2);
        DMANow(3, changmoSheetPal, SPRITE_PAL, 16);
    }

    if (opp.character == DUMMY) {
        opp.movelist = dummyMovelist;
        DMANow(3, dummySheetTiles, &CHARBLOCK[5], dummySheetTilesLen / 2);
        DMANow(3, dummySheetPal, &SPRITE_PAL[16], 16);
    }

    if (opp.character == GINGER) {
        opp.movelist = changmoMovelist;
        DMANow(3, gingerSheetTiles, &CHARBLOCK[5], gingerSheetTilesLen / 2);
        DMANow(3, gingerSheetPal, &SPRITE_PAL[16], 16);
    }

    if (opp.character == NEON) {
        opp.movelist = changmoMovelist;
        DMANow(3, neonSheetTiles, &CHARBLOCK[5], neonSheetTilesLen / 2);
        DMANow(3, neonSheetPal, &SPRITE_PAL[16], 16);
    }

    if (opp.character == NUJA) {
        opp.movelist = changmoMovelist;
        DMANow(3, nujaSheetTiles, &CHARBLOCK[5], nujaSheetTilesLen / 2);
        DMANow(3, nujaSheetPal, &SPRITE_PAL[16], 16);
    }

    player.bodyColor = SPRITE_PAL[3];
    opp.bodyColor = SPRITE_PAL[19];
}

void checkPosition() {
    if (player.x < opp.x) {
        player.direction = RIGHT;
        opp.direction = LEFT;
    }
    if (player.x > opp.x) {
        player.direction = LEFT;
        opp.direction = RIGHT;
    }
}

void drawPortraits() {
    shadowOAM[127].attr0 = ATTR0_Y(0) | ATTR0_SQUARE;
    shadowOAM[127].attr1 = ATTR1_X(0) | ATTR1_SMALL;
    shadowOAM[127].attr2 = ATTR2_TILEID(0, 14) | ATTR2_PALROW(0);

    shadowOAM[126].attr0 = ATTR0_Y(0) | ATTR0_SQUARE;
    shadowOAM[126].attr1 = ATTR1_X(224) | ATTR1_SMALL | ATTR1_HFLIP;
    shadowOAM[126].attr2 = ATTR2_TILEID(0, 14 + 16) | ATTR2_PALROW(1);
}

void updatePlayer() {
    
    //Cheat
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        if (player.health < 1100) {
            player.health += 100;
        }
    }
    
    player.walking = 0;
    player.block = 0;
    // Recalculates left and right edges of player
    if (player.direction == RIGHT) {
        player.left = player.x;
    } else {
        player.left = player.x + 16;
    }
    player.right = player.left + player.width - 1;
    player.top = player.y;
    player.bottom = player.top + player.height - 1;


    //Player can only move while not crouching or not attacking
    if (!player.attacking && !player.crouch && !player.blocking) {
        //Jump
        if (BUTTON_PRESSED(BUTTON_UP) && colorAt(player.left, player.bottom + 1) == 0) {
            player.y -= 60;
            player.inAir = 1;
        }
        //Move left
        if (BUTTON_HELD(BUTTON_LEFT) && colorAt(player.left - player.xVel, player.top) == 1 && colorAt(player.left - player.xVel, player.bottom) == 1
            && !collision(player.left - player.xVel, player.top, player.width, player.height, opp.left, opp.top, opp.width, opp.height)
            && player.screenX > 0) {
            player.x -= player.xVel;
            player.walking = 1;
            if (player.direction == RIGHT && !player.inAir) {
                player.block = HIGH;
            } else {
                player.block = 0;
            }
        }
        //Move right
        if (BUTTON_HELD(BUTTON_RIGHT) && colorAt(player.right + player.xVel, player.top) == 1 && colorAt(player.right + player.xVel, player.bottom) == 1
            && !collision(player.left + player.xVel, player.top, player.width, player.height, opp.left, opp.top, opp.width, opp.height)
            && player.screenX < SCREENWIDTH) {
            player.x += player.xVel;
            player.walking = 1;
            if (player.direction == LEFT && !player.inAir) {
                player.block = HIGH;
            } else {
                player.block = 0;
            }
        }
        //Punch
        if (BUTTON_PRESSED(BUTTON_A) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = PUNCH;
            player.currentAttack = &player.movelist[0];
            player.currentAttack->hasHit = 0;
        }
        //Kick
        if (BUTTON_PRESSED(BUTTON_B) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = KICK;
            player.currentAttack = &player.movelist[1];
            player.currentAttack->hasHit = 0;
        }
        //Overhead
        if (BUTTON_PRESSED(BUTTON_RSHOULDER) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = OVERHEAD;
            player.currentAttack = &player.movelist[4];
            player.currentAttack->hasHit = 0;
        }
        //Super
        if (BUTTON_PRESSED(BUTTON_LSHOULDER) && player.meter == 100 && !player.inAir) {
            player.meter = 0;
            player.attacking = 1;
            player.buttonPressed = SUPER;
            player.currentAttack = &player.movelist[5];
            player.currentAttack->hasHit = 0;
        }
    }

    //Crouch controls
    if (!player.attacking && !player.blocking && !player.inAir) {
        if BUTTON_HELD(BUTTON_DOWN) {
            player.crouch = 1;
        } else {
            player.crouch = 0;
        }

        if (player.crouch) {
            if (player.direction == RIGHT) {
                if (BUTTON_HELD(BUTTON_LEFT)) {
                    player.block = LOW;
                } else {
                    player.block = 0;
                }
            }
            if (player.direction == LEFT) {
                if (BUTTON_HELD(BUTTON_RIGHT)) {
                    player.block = LOW;
                } else {
                    player.block = 0;
                }
            }
            //Crouching Punch
            if (BUTTON_PRESSED(BUTTON_A)) {
                player.attacking = 1;
                player.buttonPressed = CRPUNCH;
                player.currentAttack = &player.movelist[2];
                player.currentAttack->hasHit = 0;
            }
            //Crouching Kick
            if (BUTTON_PRESSED(BUTTON_B)) {
                player.attacking = 1;
                player.buttonPressed = CRKICK;
                player.currentAttack = &player.movelist[3];
                player.currentAttack->hasHit = 0;
            }
        }
    }

    //Blockstun and reset
    if (player.blocking) {
        if (player.direction == RIGHT) {
            player.blocking = 0;
        }
        if (player.direction == LEFT) {
            player.blocking = 0;
        }
    }

    //Walking animation cycle
    if (player.walking) {
        player.walkTime--;   
        if (player.walkTime == 0) {
            player.currentWalkFrame = (player.currentWalkFrame + 1) % 3;
            player.walkTime = 10;
        }
    } else {
        player.currentWalkFrame = 0;
    }

    //Tracks startup, active frames, and cooldown of attacks using attackTimer
    if (player.attacking) {
        player.attackTimer++;
        if (player.attackTimer >= player.currentAttack->totalFrames) {
            player.attacking = 0;
            player.currentAttack = 0;
        } else if (player.attackTimer >= player.currentAttack->startup + player.currentAttack->activeFrames 
                    && player.attackTimer <= player.currentAttack->totalFrames - player.currentAttack->cooldown) {
                        spawnHitbox(player.currentAttack, &opp, &player);
        }
    } else {
        player.attackTimer = 0;
    }

    //Gravity
    if (colorAt(player.left, player.y + player.height) == 1) {
        player.y += player.yVel;
    } else {
        player.inAir = 0;
    }
}

void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y) | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.screenX) | ATTR1_MEDIUM;

    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr1 = shadowOAM[player.oamIndex].attr1 | ATTR1_HFLIP;
    }

    if (player.inAir) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(12, 4) | ATTR2_PALROW(0);

    //Crouching sprite
    } else if (player.crouch) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(12, 0) | ATTR2_PALROW(0);

        //Crouching attack sprites
        if (player.attacking && player.currentAttack != 0) {

            //Crouching Kick
            if (player.buttonPressed == CRKICK) {
                if (player.attackTimer <= player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 4) | ATTR2_PALROW(0);
                } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(28, 4) | ATTR2_PALROW(0);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 4) | ATTR2_PALROW(0);
                }

            //Crouching punch
            } else if (player.buttonPressed == CRPUNCH) {
                if (player.attackTimer <= player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 4) | ATTR2_PALROW(0);
                } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 4) | ATTR2_PALROW(0);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 4) | ATTR2_PALROW(0);
                }
            }
        }

    //Attacking sprites
    } else if (player.attacking && player.currentAttack != 0) {

        //Punch sprites
        if (player.buttonPressed == PUNCH) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 0) | ATTR2_PALROW(0);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 0) | ATTR2_PALROW(0);
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 0) | ATTR2_PALROW(0);
            }

        //Kick sprites
        } else if (player.buttonPressed == KICK) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 0) | ATTR2_PALROW(0);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(28, 0) | ATTR2_PALROW(0);
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 0) | ATTR2_PALROW(0);
            }

        //Overhead sprites
        } else if (player.buttonPressed == OVERHEAD) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 8) | ATTR2_PALROW(0);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 8) | ATTR2_PALROW(0);
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 8) | ATTR2_PALROW(0);
            }

        //Super sprites
        } else if (player.buttonPressed == SUPER) {
            if (player.attackTimer <= player.currentAttack->startup) {
                if (player.attackTimer <= 4) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(2, 12) | ATTR2_PALROW(0);
                } else if (player.attackTimer <= 8) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(6, 12) | ATTR2_PALROW(0);
                } else if (player.attackTimer <= 12) {  
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(10, 12) | ATTR2_PALROW(0);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(14, 12) | ATTR2_PALROW(0);
                }
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                if (player.attackTimer <= player.currentAttack->startup + 10) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(18, 12) | ATTR2_PALROW(0);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(22, 12) | ATTR2_PALROW(0);
                }
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(26, 12) | ATTR2_PALROW(0);
            }
        }
        //Walking sprites
    } else if (player.walking) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(4 * player.currentWalkFrame, 0);
    } else {
        //Idle sprite
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
    }
    if (player.damaged > 0) {
        SPRITE_PAL[3] = RGB(31, 0, 0);
        player.damaged++;
        if (player.damaged > 3) {
            player.damaged = 0;
        }
    } else {
        SPRITE_PAL[3] = player.bodyColor;
    }
}

void updateOpp() {

    //Variables for decisions
    int distance = abs((opp.x + opp.width/2) - (player.x + player.width/2));
    int oppAction = rand() % 100;
    int closeRange = 20;
    int midRange = 30;
    int farRange = 80;

    opp.walking = 0;
    opp.block = 0;

    // Recalculate position edges
    if (opp.direction == RIGHT) {
        opp.left = opp.x;
    } else {
        opp.left = opp.x + 16;
    }
    opp.right = opp.left + opp.width - 1;
    opp.top = opp.y;
    opp.bottom = opp.top + opp.height - 1;

    // Opp cannot act while attacking or in blockstun
    if (!opp.attacking && !opp.crouch && !opp.blocking) {

        //Range based logic
        
        //Far range
        if (distance > farRange) {

            //Move left
            if (opp.direction == LEFT && oppAction < 70) {
                opp.x -= opp.xVel;
                opp.walking = 1;
            }
            //Move right
            else if (opp.direction == RIGHT && oppAction < 70) {
                opp.x += opp.xVel;
                opp.walking = 1;
            }
        }

        //Mid Range
        else if (distance > midRange && distance <= farRange) {

            //Advance
            if (oppAction < 40) {
                if (opp.direction == LEFT) opp.x -= opp.xVel;
                else opp.x += opp.xVel;
                opp.walking = 1;
            } 
            //Kick
            else if (oppAction < 50 && !attackCooldown) { 
                opp.attacking = 1;
                opp.buttonPressed = KICK;
                opp.currentAttack = &opp.movelist[1];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
        }

        //Close Range
        else if (distance <= closeRange) {
            //Punch
            if (oppAction < 30 && !attackCooldown) {
                opp.attacking = 1;
                opp.buttonPressed = PUNCH;
                opp.currentAttack = &opp.movelist[0];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            } 
            else if (oppAction < 50) {
                opp.crouch = 1;
                opp.block = LOW;
            }
            //Overhead
            else if (oppAction < 60 && !attackCooldown) {
                opp.attacking = 1;
                opp.buttonPressed = OVERHEAD;
                opp.currentAttack = &opp.movelist[4];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
            //Super
            else if (oppAction < 65 && opp.meter == 100 && !attackCooldown) {
                opp.meter = 0;
                opp.attacking = 1;
                opp.buttonPressed = SUPER;
                opp.currentAttack = &opp.movelist[5];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
            else if (oppAction < 80) { // back up
                if (opp.direction == LEFT) opp.x += opp.xVel;
                else opp.x -= opp.xVel;
                opp.walking = 1;
            }
        }
    }

   //Crouching
    if (!opp.attacking && opp.crouch) {
        if (oppAction < 20) {
            opp.block = LOW;
        } else {
            opp.crouch = 0;
        }
    }

    //Attack animations
    if (opp.attacking) {
        opp.attackTimer++;

        if (opp.attackTimer >= opp.currentAttack->totalFrames) {
            opp.attacking = 0;
            opp.currentAttack = 0;
        } 
        else if (opp.attackTimer >= opp.currentAttack->startup + opp.currentAttack->activeFrames
            && opp.attackTimer <= opp.currentAttack->totalFrames - opp.currentAttack->cooldown) 
        {
            spawnHitbox(opp.currentAttack, &player, &opp);
        }
    } else {
        opp.attackTimer = 0;
    }


    //Gravity
    if (colorAt(opp.left, opp.y + opp.height) == 1) {
        opp.y += opp.yVel;
    } else {
        opp.inAir = 0;
    }

    //Walk animation
    if (opp.walking) {
        opp.walkTime--;
        if (opp.walkTime == 0) {
            opp.currentWalkFrame = (opp.currentWalkFrame + 1) % 3;
            opp.walkTime = 10;
        }
    } else {
        opp.currentWalkFrame = 0;
    }

    //Blockstun and reset
    if (opp.blocking) {
        if (opp.direction == RIGHT) {
            opp.blocking = 0;
        }
        if (opp.direction == LEFT) {
            opp.blocking = 0;
        }
    }

    //Cooldown on attacks
    if (attackCooldown > 0) {
        attackCooldown--;
    } else {
        attackCooldown = 0;
    }
}


void drawOpp() {
    shadowOAM[opp.oamIndex].attr0 = ATTR0_Y(opp.y) | ATTR0_SQUARE;
    shadowOAM[opp.oamIndex].attr1 = ATTR1_X(opp.screenX) | ATTR1_MEDIUM;

    if (opp.direction == LEFT) {
        shadowOAM[opp.oamIndex].attr1 = shadowOAM[opp.oamIndex].attr1 | ATTR1_HFLIP;
    }

    if (opp.inAir) {
        shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(12, 4 + 16) | ATTR2_PALROW(1);

    //Crouching sprite
    } else if (opp.crouch) {
        shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(12, 0 + 16) | ATTR2_PALROW(1);

        //Crouching attack sprites
        if (opp.attacking && opp.currentAttack != 0) {

            //Crouching Kick
            if (opp.buttonPressed == CRKICK) {
                if (opp.attackTimer <= opp.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 4 + 16) | ATTR2_PALROW(1);
                } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(28, 4 + 16) | ATTR2_PALROW(1);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(24, 4 + 16) | ATTR2_PALROW(1);
                }

            //Crouching punch
            } else if (opp.buttonPressed == CRPUNCH) {
                if (opp.attackTimer <= opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(16, 4 + 16) | ATTR2_PALROW(1);
                } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(20, 4 + 16) | ATTR2_PALROW(1);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(16, 4 + 16) | ATTR2_PALROW(1);
                }
            }
        }

    //Attacking sprites
    } else if (opp.attacking && opp.currentAttack != 0) {

        //Punch sprites
        if (opp.buttonPressed == PUNCH) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(16, 0 + 16) | ATTR2_PALROW(1);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(20, 0 + 16) | ATTR2_PALROW(1);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(16, 0 + 16) | ATTR2_PALROW(1);
            }

        //Kick sprites
        } else if (opp.buttonPressed == KICK) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(24, 0 + 16) | ATTR2_PALROW(1);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(28, 0 + 16) | ATTR2_PALROW(1);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(24, 0 + 16) | ATTR2_PALROW(1);
            }
            
        //Overhead sprites
        } else if (opp.buttonPressed == OVERHEAD) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(16, 8 + 16) | ATTR2_PALROW(1);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(20, 8 + 16) | ATTR2_PALROW(1);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(20, 8 + 16) | ATTR2_PALROW(1);
            }

        //Super sprites
        } else if (opp.buttonPressed == SUPER) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                if (opp.attackTimer <= 4) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(2, 12 + 16) | ATTR2_PALROW(1);
                } else if (opp.attackTimer <= 8) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(6, 12 + 16) | ATTR2_PALROW(1);
                } else if (opp.attackTimer <= 12) {  
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(10, 12 + 16) | ATTR2_PALROW(1);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(14, 12 + 16) | ATTR2_PALROW(1);
                }
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                if (opp.attackTimer <= opp.currentAttack->startup + 10) {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(18, 12 + 16) | ATTR2_PALROW(1);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(22, 12 + 16) | ATTR2_PALROW(1);
                }
            } else {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(26, 12 + 16) | ATTR2_PALROW(1);
            }
        }
        //Walking sprites
    } else if (opp.walking) {
        shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(4 * opp.currentWalkFrame, 0 + 16) | ATTR2_PALROW(1);
    } else {
        //Idle sprite
        shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(0, 0 + 16) | ATTR2_PALROW(1);
    }
    if (opp.damaged > 0) {
        SPRITE_PAL[19] = RGB(31, 0, 0);
        opp.damaged++;
        if (opp.damaged > 3) {
            opp.damaged = 0;
        }
    } else {
        SPRITE_PAL[19] = opp.bodyColor;
    }
}

//Keeps camera centered between both player and the opponent
void updateCamera() {
    //Calculates the leftmost and right most player
    int leftmostPlayer = (player.x < opp.x) ? player.x : opp.x;
    int rightmostPlayer = (player.x > opp.x) ? player.x : opp.x;

    //Finds the midpoint
    int midpoint = (leftmostPlayer + rightmostPlayer + player.width) / 2;

    //Centers hOff using the midpoint and shifting it half the screen left
    int centeredHOff = midpoint - (SCREENWIDTH / 2);

    //Bounds for the screen
    if (centeredHOff < 0) {
        centeredHOff = 0;
    }
    if (centeredHOff > (STAGE_WIDTH - SCREENWIDTH)) {
        centeredHOff = STAGE_WIDTH - SCREENWIDTH;
    }

    hOff = centeredHOff;

    //Updates screen position for characters
    player.screenX = player.x - hOff;
    opp.screenX = opp.x - hOff;
}

// colorAt
inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*) stage1CollisionBitmap) [OFFSET(x, y, 512)];
}

//Creates a hitbox during an attack's active frames, applies damage if connects with the target
void spawnHitbox (ATTACK *attack, PLAYER *target, PLAYER *user) {
    if (collision(attack->x, attack->y, attack->width, attack->height, target->left, target->top, target->width, target->height)
        && attack->hasHit == 0) {
        //Blocked
        if (target->block == attack->type || (target->block && attack->type == MID)) {
            target->blocking = 1;
            attack->hasHit = 1;
            if (user->meter < 100) {
                user->meter += 5;
            }
            playSoundB(block_data, block_length - 25, 0);
        //Hit
        } else {
            target->health -= attack->damage;
            target->damaged = 1;
            attack->hasHit = 1;
            if (user->meter < 100) {
                user->meter += 10;
            }
            if (target->meter < 100) {
                target->meter += 5;
            }
            playSoundB(hit_data, hit_length - 25, 0);
        }
        target->incomingAttack = attack;
    }
}

//Calculates the x and y values for attack hitboxes and stores them
void calculateAttackHitboxes() {
    player.currentAttack->y = player.top + player.currentAttack->top;

    opp.currentAttack->y = opp.top + opp.currentAttack->top;
    

    if (player.attacking && player.currentAttack) {
        if (player.direction == RIGHT) {
            player.currentAttack->x = player.right;
        } else if (player.direction == LEFT) {
            player.currentAttack->x = player.left - player.currentAttack->width;
        }
    }

    if (opp.direction == RIGHT) {
        opp.currentAttack->x = opp.right;
    } else if (opp.direction == LEFT) {
        opp.currentAttack->x = opp.left - opp.currentAttack->width;
    }
}

void updateHealthbars() {
    int playerCopy = player.health;
    int oppCopy = opp.health;
    
    int i = 0;
    int j = 0;

    //Clears player healthbar
    for (int i = 0; i < 11; i++) {
        SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(0);
    }

    //Clears opp healthbar
    for (int i = 0; i < 11; i++) {
        SCREENBLOCK[28].tilemap[32 + 17 + i] = TILEMAP_ENTRY_TILEID(0);
    }

    while (playerCopy > 0) {
        // 100% segment
        if (playerCopy >= 100) {
            SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(162) | TILEMAP_ENTRY_PALROW(2);
            playerCopy -= 100;
        // 75% segment
        } else if (playerCopy >= 75) {
            SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(194) | TILEMAP_ENTRY_PALROW(2);
            playerCopy -= 75;
        // 50% segment
        } else if (playerCopy >= 50) {
            SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(226) | TILEMAP_ENTRY_PALROW(2);
            playerCopy -= 50;
        // 25% segment
        } else if (playerCopy >= 25) {
            SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(258) | TILEMAP_ENTRY_PALROW(2);
            playerCopy -= 25;
        // Empty segment
        } else {
            SCREENBLOCK[28].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_PALROW(2);
            playerCopy = 0;
        }
        i++;
    }

    while (oppCopy > 0) {
        // 100% segment
        if (oppCopy >= 100) {
            SCREENBLOCK[28].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(162) | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
            oppCopy -= 100;
        // 75% segment
        } else if (oppCopy >= 75) {
            SCREENBLOCK[28].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(194) | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
            oppCopy -= 75;
        // 50% segment
        } else if (oppCopy >= 50) {
            SCREENBLOCK[28].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(226) | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
            oppCopy -= 50;
        // 25% segment
        } else if (oppCopy >= 25) {
            SCREENBLOCK[28].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(258) | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
            oppCopy -= 25;
        // Empty segment
        } else {
            SCREENBLOCK[28].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
            oppCopy = 0;
        }
        j++;
    }
}

void updateSupers() {
    if (player.meter > 100) player.meter = 100;
    if (opp.meter > 100) opp.meter = 100;

    int playerCopy = player.meter;
    int oppCopy = opp.meter;

    int segments = 5;   // number of bar tiles per player
    int segmentSize = 20; // 100/5

    // Draw player bar
    for (int i = 0; i < segments; i++) {
        int value = playerCopy - (i * segmentSize);

        u16 tile;
        if (value >= 20) tile = TILEMAP_ENTRY_TILEID(160);   // full
        else if (value >= 10) tile = TILEMAP_ENTRY_TILEID(192); // half
        else if (value >= 5) tile = TILEMAP_ENTRY_TILEID(224);  // quarter
        else tile = TILEMAP_ENTRY_TILEID(0); // empty

        SCREENBLOCK[28].tilemap[(32 * 17) + 1 + i] = tile | TILEMAP_ENTRY_PALROW(2);
    }

    // Draw opponent bar mirror
    for (int j = 0; j < segments; j++) {
        int value = oppCopy - (j * segmentSize);

        u16 tile;
        if (value >= 20) tile = TILEMAP_ENTRY_TILEID(160);
        else if (value >= 10) tile = TILEMAP_ENTRY_TILEID(192);
        else if (value >= 5) tile = TILEMAP_ENTRY_TILEID(224);
        else tile = TILEMAP_ENTRY_TILEID(0);

        SCREENBLOCK[28].tilemap[(32 * 17) + 28 - j] = tile | TILEMAP_ENTRY_HFLIP | TILEMAP_ENTRY_PALROW(2);
    }
}


void updateWins() {
    if (playerWins == 1) {
        SCREENBLOCK[28].tilemap[108] = TILEMAP_ENTRY_TILEID(130) | TILEMAP_ENTRY_PALROW(2);
    } 
    if (playerWins == 2) {
        SCREENBLOCK[28].tilemap[107] = TILEMAP_ENTRY_TILEID(130) | TILEMAP_ENTRY_PALROW(2);
    }

    if (oppWins == 1) {
        SCREENBLOCK[28].tilemap[113] = TILEMAP_ENTRY_TILEID(130) | TILEMAP_ENTRY_PALROW(2);
    } 
    if (oppWins == 2) {
        SCREENBLOCK[28].tilemap[114] = TILEMAP_ENTRY_TILEID(130) | TILEMAP_ENTRY_PALROW(2);
    }
}

void clearWins() {
    SCREENBLOCK[28].tilemap[108] = TILEMAP_ENTRY_TILEID(129) | TILEMAP_ENTRY_PALROW(2);
    SCREENBLOCK[28].tilemap[107] = TILEMAP_ENTRY_TILEID(129) | TILEMAP_ENTRY_PALROW(2);
    SCREENBLOCK[28].tilemap[113] = TILEMAP_ENTRY_TILEID(129) | TILEMAP_ENTRY_PALROW(2);
    SCREENBLOCK[28].tilemap[114] = TILEMAP_ENTRY_TILEID(129) | TILEMAP_ENTRY_PALROW(2);
}