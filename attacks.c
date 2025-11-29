#include "attacks.h"
#include "gba.h"
#include "game.h"

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

//Initializes attack attributes
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


