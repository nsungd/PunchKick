# 0 "game.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



# 1 "attacks.h" 1



typedef struct {
    int activeFrames;
    int cooldown;
    int startup;
    int totalFrames;
    int power;
    int damage;
    int type;
    int index;
    int hasHit;

    int x;
    int y;
    int height;
    int width;
} ATTACK;


extern ATTACK attacks[100];


enum power{
    WEAK,
    MED,
    STRONG,
};
extern enum power POWER;


enum type {
    HIGH = 1,
    LOW,
    MID,
    GRAB
};
extern enum type TYPE;


enum character {
    DUMMY,
    CHANGMO,
};
extern enum character CHARACTER;


enum buttonPressed {
    PUNCH = 1,
    CRPUNCH,
    JPUNCH,
    KICK,
    CRKICK,
    JKICK,
    OVERHEAD,
    THROW,
    SPECIAL,
    SUPER,
};
extern enum buttonPressed BUTTON;

extern ATTACK changmoPunch;
extern ATTACK changmoKick;
extern ATTACK changmoCrPunch;
extern ATTACK changmoCrKick;
extern ATTACK changmoHigh;
extern ATTACK changmoSp;
extern ATTACK changmoSuper;

extern ATTACK dummyPunch;

void initAttacks();
# 5 "game.h" 2



typedef struct {
    int x;
    int y;
    int screenX;
    int screenY;
    int xVel;
    int yVel;

    int width;
    int height;

    int left;
    int right;
    int top;
    int bottom;

    int crouch;
    int block;
    int blocking;
    int blockTimer;
    int attacking;
    int attackTimer;
    int buttonPressed;

    int health;
    int meter;
    int knockdown;
    int hitstun;
    int damaged;
    int direction;
    int walking;
    int currentWalkFrame;
    int walkTime;
    int character;
    int oamIndex;

    ATTACK *currentAttack;
    ATTACK *incomingAttack;
} PLAYER;

enum direction {
    LEFT,
    RIGHT
};
extern enum direction DIRECTION;

extern int stage;
extern int hOff;

extern PLAYER player;
extern PLAYER opp;


void initGame();
void updatePlayer();
void updateOpp();
void updateCamera();
void drawPlayer();
void drawOpp();
void calculateAttackHitboxes();
void spawnHitbox(ATTACK *attack, PLAYER *target);
void checkPosition();
void drawPortraits();
void updateHealthbars();

inline unsigned char colorAt(int x, int y);
# 2 "game.c" 2
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 49 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 68 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 102 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 3 "game.c" 2
# 1 "stage1Collision.h" 1
# 21 "stage1Collision.h"
extern const unsigned short stage1CollisionBitmap[65536];


extern const unsigned short stage1CollisionPal[256];
# 4 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int currentFrame;
  int numFrames;
  u8 oamIndex;
} SPRITE;
# 5 "game.c" 2

# 1 "analogSound.h" 1
# 257 "analogSound.h"
extern enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime);
void playNoteWithDuration(NoteWithDuration *n, unsigned char duty);
void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty);
void playAnalogSound(unsigned short sound);
# 7 "game.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void setupSoundInterrupts();
void interruptHandler();

void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 52 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

extern SOUND soundA;
extern SOUND soundB;
# 8 "game.c" 2
# 1 "hit.h" 1


extern const unsigned int hit_sampleRate;
extern const unsigned int hit_length;
extern const signed char hit_data[];
# 9 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 10 "game.c" 2

PLAYER player;
PLAYER opp;

enum direction DIRECTION;

int stage;
int hOff;
int frameCounter;
int damagedFrames;

void initGame() {

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
    shadowOAM[127].attr0 = ((0) & 0xFF) | (0<<14);
    shadowOAM[127].attr1 = ((0) & 0x1FF) | (1<<14);
    shadowOAM[127].attr2 = ((((9) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);

    shadowOAM[126].attr0 = ((0) & 0xFF) | (0<<14);
    shadowOAM[126].attr1 = ((224) & 0x1FF) | (1<<14);
    shadowOAM[126].attr2 = ((((9) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
}

void updatePlayer() {
    player.walking = 0;
    player.block = 0;

    if (player.direction == RIGHT) {
        player.left = player.x;
    } else {
        player.left = player.x + 16;
    }
    player.right = player.left + player.width - 1;
    player.top = player.y;
    player.bottom = player.top + player.height - 1;



    if (!player.attacking && !player.crouch && !player.blocking) {

        if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && colorAt(player.left, player.bottom + 1) == 0) {
        player.y -= 60;
        }

        if ((~(buttons) & ((1<<5))) && colorAt(player.left - player.xVel, player.top) == 1 && colorAt(player.left - player.xVel, player.bottom) == 1
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

        if ((~(buttons) & ((1<<4))) && colorAt(player.right + player.xVel, player.top) == 1 && colorAt(player.right + player.xVel, player.bottom) == 1
            && !collision(player.left + player.xVel, player.top, player.width, player.height, opp.left, opp.top, opp.width, opp.height)
            && player.screenX < 240) {
            player.x += player.xVel;
            player.walking = 1;
            if (player.direction == LEFT) {
                player.block = HIGH;
            } else {
                player.block = 0;
            }
        }

        if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
            player.attacking = 1;
            player.buttonPressed = PUNCH;
            player.currentAttack = &changmoPunch;
            player.currentAttack->hasHit = 0;
        }

        if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
            player.attacking = 1;
            player.buttonPressed = KICK;
            player.currentAttack = &changmoKick;
            player.currentAttack->hasHit = 0;
        }
    }


    if (!player.attacking && !player.blocking) {
        if (~(buttons) & ((1<<7))) {
            player.crouch = 1;
        } else {
            player.crouch = 0;
        }

        if (player.crouch) {
            if (player.direction == RIGHT) {
                if ((~(buttons) & ((1<<5)))) {
                    player.block = LOW;
                } else {
                    player.block = 0;
                }
            }
            if (player.direction == LEFT) {
                if ((~(buttons) & ((1<<4)))) {
                    player.block = LOW;
                } else {
                    player.block = 0;
                }
            }
        }
    }


    if (player.blocking) {
        if (player.direction == RIGHT) {
            player.blocking = 0;
        }
        if (player.direction == LEFT) {
            player.blocking = 0;
        }
    }



    if (player.walking) {
        player.walkTime--;
        if (player.walkTime == 0) {
            player.currentWalkFrame = (player.currentWalkFrame + 1) % 3;
            player.walkTime = 10;
        }
    } else {
        player.currentWalkFrame = 0;
    }


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


    if (colorAt(player.left, player.y + player.height) == 1) {
        player.y += player.yVel;
    }
}

void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ((player.y) & 0xFF) | (0<<14);
    shadowOAM[player.oamIndex].attr1 = ((player.screenX) & 0x1FF) | (2<<14);
    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr1 = shadowOAM[player.oamIndex].attr1 | (1<<12);
    }

    if (player.crouch) {
        shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (12))) & 0x3FF) | (((0) & 0xF) <<12);

    } else if (player.attacking && player.currentAttack != 0) {

        if (player.buttonPressed == PUNCH) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
            }

        } else if (player.buttonPressed == KICK) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (24))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
            }
        }

    } else if (player.walking) {
        shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (4 * player.currentWalkFrame))) & 0x3FF);
    } else {

        shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
    }
    if (player.damaged > 0) {
        ((u16 *)0x5000200)[3] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        player.damaged++;
        if (player.damaged > 3) {
            player.damaged = 0;
        }
    } else {
        ((u16 *)0x5000200)[3] = (((30) & 31) | ((19) & 31) << 5 | ((10) & 31) << 10);
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
    shadowOAM[opp.oamIndex].attr0 = ((opp.y) & 0xFF) | (0<<14);
    shadowOAM[opp.oamIndex].attr1 = ((opp.screenX) & 0x1FF) | (2<<14);
    if (opp.direction == LEFT) {
        shadowOAM[opp.oamIndex].attr1 = shadowOAM[opp.oamIndex].attr1 | (1<<12);
    }
    if (opp.attacking) {
        if (opp.buttonPressed == PUNCH) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((4) * (32) + (4))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((4) * (32) + (8))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ((((4) * (32) + (4))) & 0x3FF) | (((0) & 0xF) <<12);
            }
        }
    } else {
        shadowOAM[opp.oamIndex].attr2 = ((((4) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
    }
    if (opp.damaged > 0) {
        ((u16 *)0x5000200)[8] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        opp.damaged++;
        if (opp.damaged > 3) {
            opp.damaged = 0;
        }
    } else {
        ((u16 *)0x5000200)[8] = (((24) & 31) | ((24) & 31) << 5 | ((27) & 31) << 10);
    }
}


void updateCamera() {

    int leftmostPlayer = (player.x < opp.x) ? player.x : opp.x;
    int rightmostPlayer = (player.x > opp.x) ? player.x : opp.x;


    int midpoint = (leftmostPlayer + rightmostPlayer + player.width) / 2;


    int centeredHOff = midpoint - (240 / 2);


    if (centeredHOff < 0) {
        centeredHOff = 0;
    }
    if (centeredHOff > (416 - 240)) {
        centeredHOff = 416 - 240;
    }

    hOff = centeredHOff;


    player.screenX = player.x - hOff;
    opp.screenX = opp.x - hOff;
}


inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*) stage1CollisionBitmap) [((y) * (512) + (x))];
}


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


    for (int i = 0; i < 11; i++) {
        ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((0) & 1023);
    }


    for (int i = 0; i < 11; i++) {
        ((SB*) 0x6000000)[29].tilemap[32 + 17 + i] = ((0) & 1023);
    }

    while (playerCopy > 0) {

        if (playerCopy >= 100) {
            ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((162) & 1023);
            playerCopy -= 100;

        } else if (playerCopy >= 75) {
            ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((194) & 1023);
            playerCopy -= 75;

        } else if (playerCopy >= 50) {
            ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((226) & 1023);
            playerCopy -= 50;

        } else if (playerCopy >= 25) {
            ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((258) & 1023);
            playerCopy -= 25;

        } else {
            ((SB*) 0x6000000)[29].tilemap[32 + 12 - i] = ((0) & 1023);
            playerCopy = 0;
        }
        i++;
    }

    while (oppCopy > 0) {

        if (oppCopy >= 100) {
            ((SB*) 0x6000000)[29].tilemap[32 + 17 + j] = ((162) & 1023) | (1 << 10);
            oppCopy -= 100;

        } else if (oppCopy >= 75) {
            ((SB*) 0x6000000)[29].tilemap[32 + 17 + j] = ((194) & 1023) | (1 << 10);
            oppCopy -= 75;

        } else if (oppCopy >= 50) {
            ((SB*) 0x6000000)[29].tilemap[32 + 17 + j] = ((226) & 1023) | (1 << 10);
            oppCopy -= 50;

        } else if (oppCopy >= 25) {
            ((SB*) 0x6000000)[29].tilemap[32 + 17 + j] = ((258) & 1023) | (1 << 10);
            oppCopy -= 25;

        } else {
            ((SB*) 0x6000000)[29].tilemap[32 + 17 + j] = ((0) & 1023) | (1 << 10);
            oppCopy = 0;
        }
        j++;
    }
}
