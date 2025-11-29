# 0 "attacks.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "attacks.c"
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
# 2 "attacks.c" 2
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
# 3 "attacks.c" 2
# 1 "game.h" 1







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
# 4 "attacks.c" 2

ATTACK changmoPunch;
ATTACK changmoKick;
ATTACK changmoCrPunch;
ATTACK changmoCrKick;
ATTACK changmoHigh;
ATTACK changmoSp;
ATTACK changmoSuper;

ATTACK dummyPunch;


enum power POWER;
enum type TYPE;
enum character CHARACTER;
enum buttonPressed BUTTON;


void initAttacks() {
    changmoPunch.activeFrames = 3;
    changmoPunch.startup = 3;
    changmoPunch.cooldown = 3;
    changmoPunch.totalFrames = 9;
    changmoPunch.type = MID;
    changmoPunch.power = WEAK;
    changmoPunch.damage = 100;
    changmoPunch.width = 12;
    changmoPunch.height = 4;

    changmoKick.activeFrames = 7;
    changmoKick.startup = 9;
    changmoKick.cooldown = 7;
    changmoKick.totalFrames = 23;
    changmoKick.type = MID;
    changmoKick.power = MED;
    changmoKick.damage = 200;
    changmoKick.width = 17;
    changmoKick.height = 9;

    dummyPunch.activeFrames = 7;
    dummyPunch.startup = 9;
    dummyPunch.cooldown = 20;
    dummyPunch.totalFrames = 36;
    dummyPunch.type = MID;
    dummyPunch.power = STRONG;
    dummyPunch.damage = 200;
    dummyPunch.width = 18;
    dummyPunch.height = 16;
}
