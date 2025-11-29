# 0 "main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 12 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 2 3 4
#pragma GCC diagnostic pop
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
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
# 6 "main.c" 2
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
# 7 "main.c" 2

# 1 "LightningPandemonium.h" 1


extern const unsigned int LightningPandemonium_sampleRate;
extern const unsigned int LightningPandemonium_length;
extern const signed char LightningPandemonium_data[];
# 9 "main.c" 2

# 1 "gameTiles.h" 1
# 21 "gameTiles.h"
extern const unsigned short gameTilesTiles[8192];


extern const unsigned short gameTilesPal[256];
# 11 "main.c" 2

# 1 "start.h" 1
# 21 "start.h"
extern const unsigned short startBitmap[19200];


extern const unsigned short startPal[256];
# 13 "main.c" 2
# 1 "start2.h" 1
# 21 "start2.h"
extern const unsigned short start2Bitmap[19200];


extern const unsigned short start2Pal[256];
# 14 "main.c" 2
# 1 "css.h" 1







extern const unsigned short cssMap[1024];
# 15 "main.c" 2
# 1 "instructions.h" 1
# 21 "instructions.h"
extern const unsigned short instructionsBitmap[19200];


extern const unsigned short instructionsPal[256];
# 16 "main.c" 2

# 1 "stage1.h" 1







extern const unsigned short stage1Map[2048];
# 18 "main.c" 2
# 1 "stage1Tiles.h" 1
# 21 "stage1Tiles.h"
extern const unsigned short stage1TilesTiles[8192];


extern const unsigned short stage1TilesPal[256];
# 19 "main.c" 2

# 1 "stage2SkyBG.h" 1
# 21 "stage2SkyBG.h"
extern const unsigned short stage2SkyBGTiles[8192];


extern const unsigned short stage2SkyBGPal[256];
# 21 "main.c" 2
# 1 "train.h" 1
# 21 "train.h"
extern const unsigned short trainTiles[8192];


extern const unsigned short trainPal[256];
# 22 "main.c" 2
# 1 "stage2FullBackground.h" 1







extern const unsigned short stage2FullBackgroundMap[2048];
# 23 "main.c" 2
# 1 "stage2Train.h" 1







extern const unsigned short stage2TrainMap[2048];
# 24 "main.c" 2

# 1 "stage3.h" 1







extern const unsigned short stage3Map[2048];
# 26 "main.c" 2
# 1 "stage3Tileset.h" 1
# 21 "stage3Tileset.h"
extern const unsigned short stage3TilesetTiles[8192];


extern const unsigned short stage3TilesetPal[256];
# 27 "main.c" 2

# 1 "pause.h" 1







extern const unsigned short pauseMap[1024];
# 29 "main.c" 2
# 1 "win.h" 1
# 21 "win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 30 "main.c" 2
# 1 "lose.h" 1
# 21 "lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 31 "main.c" 2
# 1 "ui.h" 1







extern const unsigned short uiMap[1024];
# 32 "main.c" 2

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
# 34 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[8192];


extern const unsigned short spritesheetPal[256];
# 35 "main.c" 2

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
# 37 "main.c" 2



void initialize();
void goToStart();
void start();
void goToCSS();
void css();
void goToInstructions();
void instructions();
void goToStage1();
void stage1();
void goToStage2();
void stage2();
void goToStage3();
void stage3();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

void switchMode4();
void switchMode0();

typedef enum {
    START,
    INSTRUCTIONS,
    CHARACTERSELECT,
    STAGE1,
    STAGE2,
    STAGE3,
    PAUSE,
    WIN,
    LOSE,
}; int state;

u16 buttons;
u16 oldButtons;
int startFrames;
int prevState;
int bgScroll;
OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        if (state == STAGE2 || (state == PAUSE && prevState == STAGE2)) {
            (*(volatile unsigned short*) 0x04000018) = hOff;
            (*(volatile unsigned short*) 0x0400001C) = bgScroll;
        } else {
            (*(volatile unsigned short*) 0x0400001C) = hOff;
        }


        switch(state) {
            case START:
            start();
            break;
            case CHARACTERSELECT:
            css();
            break;
            case INSTRUCTIONS:
            instructions();
            break;
            case STAGE1:
            stage1();
            break;
            case STAGE2:
            stage2();
            break;
            case STAGE3:
            stage3();
            break;
            case PAUSE:
            pause();
            break;
            case WIN:
            win();
            break;
            case LOSE:
            lose();
            break;
        }
    }
}

void initialize() {
    mgba_open();
    initSound();
    setupSounds();
    setupSoundInterrupts();



    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    initAttacks();
    goToStart();

}

void goToStart() {
    hOff = 0;
    switchMode4();
    DMANow(3, startPal, ((unsigned short *)0x5000000), 512 / 2);
    state = START;
}

void start() {
    startFrames++;
    if (startFrames >= 30) {
        drawFullscreenImage4(start2Bitmap);
        if (startFrames == 60) {
            startFrames = 0;
        }
    } else {
        drawFullscreenImage4(startBitmap);
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {

        goToInstructions();
    }
    if (!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) {
        goToInstructions();
    }
}

void goToCSS() {
    switchMode0();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (3 % 4)))| (1 << 12);
    DMANow(3, gameTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, cssMap, &((SB*) 0x6000000)[30], (2048) / 2);
    (*(volatile unsigned short*) 0x400000E) = ((0) << 2) | ((30) << 8);
    state = CHARACTERSELECT;
}

void css() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        initGame();
        goToStage1();
    }
}

void goToInstructions() {
    switchMode4();
    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 512 / 3);
    drawFullscreenImage4(instructionsBitmap);
    state = INSTRUCTIONS;
}

void instructions() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {

        initGame();
        goToStage1();
    }
    if (!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) {
        goToStart();
    }
}

void goToStage1() {
    switchMode0();

    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, stage1TilesTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, stage1TilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, stage1Map, &((SB*) 0x6000000)[30], (4096) / 2);
    DMANow(3, uiMap, &((SB*) 0x6000000)[29], (2048) / 2);
    (*(volatile unsigned short*) 0x400000E) = ((1) << 2) | ((30) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((29) << 8);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) |(1 << (8 + (3 % 4))) | (1 << 12);
    state = STAGE1;
}

void stage1() {
    drawPortraits();
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    calculateAttackHitboxes();
    drawPlayer();
    drawOpp();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        prevState = STAGE1;
        goToPause();
    }
    if (opp.health <= 0) {
        prevState = STAGE1;
        goToStage2();
    }
    if (player.health <= 0) {
        goToLose();
    }
}

void goToStage2() {
    DMANow(3, stage2SkyBGPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, trainPal, &((unsigned short *)0x5000000)[16] , 16);
    DMANow(3, stage2SkyBGTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, stage2FullBackgroundMap, &((SB*) 0x6000000)[30], (4096) / 2);
    DMANow(3, trainTiles, &((CB*) 0x6000000)[2], 16384 / 2);
    DMANow(3, stage2TrainMap, &((SB*) 0x6000000)[20], (4096) / 2);


    for (int i = 0; i < (4096); i++) {
        ((SB*) 0x6000000)[20].tilemap[i] |= (((1) & 15) << 12);
    }

    (*(volatile unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short*) 0x400000E) = ((1) << 2) | ((30) << 8) | (1 << 14) | (1 << 12);
    (*(volatile unsigned short*) 0x400000C) = ((2) << 2) | ((20) << 8) | (1 << 12);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    if (prevState == STAGE1) {
        initGame();
    }
    state = STAGE2;
}

void stage2() {
    bgScroll += 4;
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    calculateAttackHitboxes();
    drawPlayer();
    drawOpp();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        prevState = STAGE2;
        goToPause();
    }
    if (opp.health <= 0) {
        prevState = STAGE2;
        (*(volatile unsigned short *)0x4000000) |= !(1 << (8 + (2 % 4)));
        goToStage3();
    }
    if (player.health <= 0) {
        goToLose();
    }
}

void goToStage3() {
    DMANow(3, stage3TilesetPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, stage3TilesetTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, stage3Map, &((SB*) 0x6000000)[20], (4096) / 2);


    (*(volatile unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short*) 0x400000E) = ((1) << 2) | ((20) << 8) | (1 << 14) | (1 << 12);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    if (prevState == STAGE2) {
        initGame();
    }
    state = STAGE3;
}

void stage3() {
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    calculateAttackHitboxes();
    drawPlayer();
    drawOpp();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        prevState = STAGE3;
        goToPause();
    }
    if (opp.health <= 0) {
        goToWin();
    }
    if (player.health <= 0) {
        goToLose();
    }
}

void goToPause() {
    (*(volatile unsigned short *)0x4000000) |= (1 << (8 + (1 % 4)));
    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((24) << 8);
    state = PAUSE;
}

void pause() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        if (prevState == STAGE1) {
            (*(volatile unsigned short *)0x4000000) &= ~(1 << (8 + (1 % 4)));
            goToStage1();
        }
        if (prevState == STAGE2) {
            (*(volatile unsigned short *)0x4000000) &= ~(1 << (8 + (1 % 4)));
            goToStage2();
        }
        if (prevState == STAGE3) {
            (*(volatile unsigned short *)0x4000000) &= ~(1 << (8 + (1 % 4)));
            goToStage3();
        }
    }
    if (!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) {
        goToStart();
    }
}

void goToWin() {
    hOff = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    switchMode4();
    DMANow(3, winPal, ((unsigned short *)0x5000000), 512 / 2);
    drawFullscreenImage4(winBitmap);
    state = WIN;
}

void win() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        goToStart();
    }
}

void goToLose() {
    hOff = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    switchMode4();
    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    drawFullscreenImage4(loseBitmap);
    state = LOSE;
}

void lose() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        goToStart();
    }
}

void switchMode4() {

    (*(volatile unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, 0, ((unsigned short*) 0x06000000), (2 << 23) | 240 * 160 / 2);
    DMANow(3, 0, ((unsigned short*) 0x0600A000), (2 << 23) | 240 * 160 / 2);

}

void switchMode0() {

    (*(volatile unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short *)0x4000000) = ((0) & 7);
    DMANow(3, gameTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, cssMap, &((SB*) 0x6000000)[30], (2048) / 2);
    DMANow(3, stage1Map, &((SB*) 0x6000000)[27], (4096) / 2);
    DMANow(3, stage3Map, &((SB*) 0x6000000)[20], (4096) / 2);
    DMANow(3, pauseMap, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, spritesheetTiles, &((CB*) 0x6000000)[4], 16384 / 2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 512 / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
