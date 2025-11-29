#include "game.h"
#include "gba.h"
#include "stage1Collision.h"
#include "sprites.h"
#include "attacks.h"
#include "analogSound.h"
#include "digitalSound.h"
#include "hit.h"
#include "mode0.h"

PLAYER player;
PLAYER opp;

enum direction DIRECTION;

int stage;
int hOff;
int frameCounter;
int damagedFrames;

void initGame() {
    //Player attributes
    player.x = 160;
    player.y = 96;
    player.xVel = 1;
    player.yVel = 1;
    player.width = 16;
    player.height = 32;
    player.health = 1100;
    player.direction = RIGHT;
    player.attacking = 0;
    player.currentAttack = 0;
    player.oamIndex = 0;
    player.character = CHANGMO;
    
    player.walkTime = 10;
    player.currentWalkFrame = 0;

    stage = 1;

    //Dummy attributes
    opp.x = 224;
    opp.y = 96;
    opp.xVel = 1;
    opp.yVel = 1;
    opp.width = 16;
    opp.height = 32;
    opp.health = 1100;
    opp.direction = LEFT;
    opp.oamIndex = 1;
    opp.character = DUMMY;
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
    shadowOAM[127].attr2 = ATTR2_TILEID(0, 9) | ATTR2_PALROW(0);

    shadowOAM[126].attr0 = ATTR0_Y(0) | ATTR0_SQUARE;
    shadowOAM[126].attr1 = ATTR1_X(224) | ATTR1_SMALL;
    shadowOAM[126].attr2 = ATTR2_TILEID(2, 9) | ATTR2_PALROW(0);
}

void updatePlayer() {
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
        }
        //Move left
        if (BUTTON_HELD(BUTTON_LEFT) && colorAt(player.left - player.xVel, player.top) == 1 && colorAt(player.left - player.xVel, player.bottom) == 1
            && !collision(player.left - player.xVel, player.top, player.width, player.height, opp.left, opp.top, opp.width, opp.height)
            && player.screenX > 0) {
            player.x -= player.xVel;
            player.walking = 1;
            if (player.direction == RIGHT) {
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
            if (player.direction == LEFT) {
                player.block = HIGH;
            } else {
                player.block = 0;
            }
        }
        //Punch
        if (BUTTON_PRESSED(BUTTON_A)) {
            player.attacking = 1;
            player.buttonPressed = PUNCH;
            player.currentAttack = &changmoPunch;
            player.currentAttack->hasHit = 0;
        }
        //Kick
        if (BUTTON_PRESSED(BUTTON_B)) {
            player.attacking = 1;
            player.buttonPressed = KICK;
            player.currentAttack = &changmoKick;
            player.currentAttack->hasHit = 0;
        }
    }

    //Crouch controls
    if (!player.attacking && !player.blocking) {
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
        }
    }

    //Blockstun
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
                        spawnHitbox(player.currentAttack, &opp);
        }
    } else {
        player.attackTimer = 0;
    }

    //Gravity
    if (colorAt(player.left, player.y + player.height) == 1) {
        player.y += player.yVel;
    }
}

void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y) | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.screenX) | ATTR1_MEDIUM;
    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr1 = shadowOAM[player.oamIndex].attr1 | ATTR1_HFLIP;
    }
    //Crouching sprite
    if (player.crouch) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(12, 0) | ATTR2_PALROW(0);
        //Attacking sprites
    } else if (player.attacking && player.currentAttack != 0) {
        //Punch sprites
        if (player.buttonPressed == PUNCH) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(16, 0) | ATTR2_PALROW(0);
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
            }
        //Kick sprites
        } else if (player.buttonPressed == KICK) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 0) | ATTR2_PALROW(0);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(24, 0) | ATTR2_PALROW(0);
            } else {
                shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 0) | ATTR2_PALROW(0);
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
        SPRITE_PAL[3] = RGB(30, 19, 10);
    }
}

void updateOpp() {
    if (opp.direction == RIGHT) {
        opp.left = opp.x;
    } else {
        opp.left = opp.x + 16;

    }
    opp.right = opp.left + opp.width - 1;
    opp.top = opp.y;
    opp.bottom = opp.top + opp.height - 1;

    if (!opp.attacking) {

        // if (opp.direction == LEFT && opp.x - player.x == 1) {
        //     opp.x -= opp.xVel;
        // } else {
        //     opp.x += opp.xVel;
        // }
        frameCounter++;
        if (frameCounter >= 180) {
            opp.attacking = 1;
            opp.buttonPressed = PUNCH;
            opp.currentAttack = &dummyPunch;
            opp.currentAttack->hasHit = 0;
            frameCounter = 0;
        }
    }

    if (opp.attacking) {
        opp.attackTimer++;
        if (opp.attackTimer >= opp.currentAttack->totalFrames) {
            opp.attacking = 0;
            opp.currentAttack = 0;
        } else if (opp.attackTimer >= opp.currentAttack->startup + opp.currentAttack->activeFrames 
                    && opp.attackTimer <= opp.currentAttack->totalFrames - opp.currentAttack->cooldown) {
                        spawnHitbox(opp.currentAttack, &player);
        }
    } else {
        opp.attackTimer = 0;
    }
}

void drawOpp() {
    shadowOAM[opp.oamIndex].attr0 = ATTR0_Y(opp.y) | ATTR0_SQUARE;
    shadowOAM[opp.oamIndex].attr1 = ATTR1_X(opp.screenX) | ATTR1_MEDIUM;
    if (opp.direction == LEFT) {
        shadowOAM[opp.oamIndex].attr1 = shadowOAM[opp.oamIndex].attr1 | ATTR1_HFLIP;
    }
    if (opp.attacking) {
        if (opp.buttonPressed == PUNCH) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(4, 4) | ATTR2_PALROW(0);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(8, 4) | ATTR2_PALROW(0);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(4, 4) | ATTR2_PALROW(0);
            }
        }
    } else {
        shadowOAM[opp.oamIndex].attr2 = ATTR2_TILEID(0, 4) | ATTR2_PALROW(0);
    }
    if (opp.damaged > 0) {
        SPRITE_PAL[8] = RGB(31, 0, 0);
        opp.damaged++;
        if (opp.damaged > 3) {
            opp.damaged = 0;
        }
    } else {
        SPRITE_PAL[8] = RGB(24, 24, 27);
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
void spawnHitbox (ATTACK *attack, PLAYER *target) {
    if (collision(attack->x, attack->y, attack->width, attack->height, target->left, target->top, target->width, target->height)
        && attack->hasHit == 0) {
        if (target->block == attack->type || (target->block && attack->type == MID)) {
            target->blocking = 1;
            attack->hasHit = 1;
        } else {
            target->health -= attack->damage;
            target->damaged = 1;
            attack->hasHit = 1;
            playSoundB(hit_data, hit_length - 25, 0);
        }
        target->incomingAttack = attack;
    }
}

//Calculates the x and y values for attack hitboxes and stores them
void calculateAttackHitboxes() {
    changmoPunch.y = player.top + 10;
    changmoKick.y = player.top + 15;

    dummyPunch.y = player.top + 7;
    
    if (player.direction == RIGHT) {
        player.currentAttack->x = player.right;
    } else if (player.direction == LEFT) {
        player.currentAttack->x = player.left - player.currentAttack->width;
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
        SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(0);
    }

    //Clears opp healthbar
    for (int i = 0; i < 11; i++) {
        SCREENBLOCK[29].tilemap[32 + 17 + i] = TILEMAP_ENTRY_TILEID(0);
    }

    while (playerCopy > 0) {
        // 100% segment
        if (playerCopy >= 100) {
            SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(162);
            playerCopy -= 100;
        // 75% segment
        } else if (playerCopy >= 75) {
            SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(194);
            playerCopy -= 75;
        // 50% segment
        } else if (playerCopy >= 50) {
            SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(226);
            playerCopy -= 50;
        // 25% segment
        } else if (playerCopy >= 25) {
            SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(258);
            playerCopy -= 25;
        // Empty segment
        } else {
            SCREENBLOCK[29].tilemap[32 + 12 - i] = TILEMAP_ENTRY_TILEID(0);
            playerCopy = 0;
        }
        i++;
    }

    while (oppCopy > 0) {
        // 100% segment
        if (oppCopy >= 100) {
            SCREENBLOCK[29].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(162) | TILEMAP_ENTRY_HFLIP;
            oppCopy -= 100;
        // 75% segment
        } else if (oppCopy >= 75) {
            SCREENBLOCK[29].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(194) | TILEMAP_ENTRY_HFLIP;
            oppCopy -= 75;
        // 50% segment
        } else if (oppCopy >= 50) {
            SCREENBLOCK[29].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(226) | TILEMAP_ENTRY_HFLIP;
            oppCopy -= 50;
        // 25% segment
        } else if (oppCopy >= 25) {
            SCREENBLOCK[29].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(258) | TILEMAP_ENTRY_HFLIP;
            oppCopy -= 25;
        // Empty segment
        } else {
            SCREENBLOCK[29].tilemap[32 + 17 + j] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_HFLIP;
            oppCopy = 0;
        }
        j++;
    }
}