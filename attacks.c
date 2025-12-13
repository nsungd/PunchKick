#include "attacks.h"
#include "gba.h"
#include "game.h"

ATTACK changmoPunch;
ATTACK changmoKick;
ATTACK changmoCrPunch;
ATTACK changmoCrKick;
ATTACK changmoHigh;
ATTACK changmoOverhead;
ATTACK changmoSuper;

ATTACK changmoMovelist[20];

ATTACK dummyPunch;
ATTACK dummyMovelist[20];


enum power POWER;
enum type TYPE;
enum character CHARACTER;
enum buttonPressed BUTTON;

//Initializes attack attributes
void initAttacks() {
    changmoPunch.activeFrames = 3;
    changmoPunch.startup = 3;
    changmoPunch.cooldown = 3;
    changmoPunch.totalFrames = changmoPunch.startup + changmoPunch.activeFrames + changmoPunch.cooldown;
    changmoPunch.type = MID;
    changmoPunch.power = WEAK;
    changmoPunch.damage = 100;
    changmoPunch.width = 12;
    changmoPunch.height = 4;
    changmoPunch.top = 10;

    changmoKick.activeFrames = 7;
    changmoKick.startup = 9;
    changmoKick.cooldown = 7;
    changmoKick.totalFrames = changmoKick.startup + changmoKick.activeFrames + changmoKick.cooldown;;
    changmoKick.type = MID;
    changmoKick.power = MED;
    changmoKick.damage = 200;
    changmoKick.width = 17;
    changmoKick.height = 9;
    changmoKick.top = 15;

    changmoCrPunch.activeFrames = 6;
    changmoCrPunch.startup = 5;
    changmoCrPunch.cooldown = 20;
    changmoCrPunch.totalFrames = changmoCrPunch.startup + changmoCrPunch.activeFrames + changmoCrPunch.cooldown;;
    changmoCrPunch.type = MID;
    changmoCrPunch.power = STRONG;
    changmoCrPunch.damage = 300;
    changmoCrPunch.width = 6;
    changmoCrPunch.height = 13;
    changmoCrPunch.top = 8;

    changmoCrKick.activeFrames = 6;
    changmoCrKick.startup = 9;
    changmoCrKick.cooldown = 12;
    changmoCrKick.totalFrames = changmoCrKick.startup + changmoCrKick.activeFrames + changmoCrKick.cooldown;;
    changmoCrKick.type = LOW;
    changmoCrKick.power = STRONG;
    changmoCrKick.damage = 200;
    changmoCrKick.width = 16;
    changmoCrKick.height = 6;
    changmoCrKick.top = 19;

    changmoOverhead.activeFrames = 4;
    changmoOverhead.startup = 15;
    changmoOverhead.cooldown = 12;
    changmoOverhead.totalFrames = changmoOverhead.activeFrames + changmoOverhead.startup + changmoOverhead.cooldown;
    changmoOverhead.type = HIGH;
    changmoOverhead.power = MED;
    changmoOverhead.damage = 300;
    changmoOverhead.width = 12;
    changmoOverhead.height = 16;
    changmoOverhead.top = 16;

    changmoSuper.activeFrames = 20;
    changmoSuper.startup = 20;
    changmoSuper.cooldown = 20;
    changmoSuper.totalFrames = changmoSuper.startup + changmoSuper.activeFrames + changmoSuper.cooldown;
    changmoSuper.type = MID;
    changmoSuper.power = STRONG;
    changmoSuper.damage = 700;
    changmoSuper.width = 16;
    changmoSuper.height = 9;
    changmoSuper.top = 8;

    changmoMovelist[0] = changmoPunch;
    changmoMovelist[1] = changmoKick;
    changmoMovelist[2] = changmoCrPunch;
    changmoMovelist[3] = changmoCrKick;
    changmoMovelist[4] = changmoOverhead;
    changmoMovelist[5] = changmoSuper;

    dummyPunch.activeFrames = 7;
    dummyPunch.startup = 9;
    dummyPunch.cooldown = 20;
    dummyPunch.totalFrames = dummyPunch.startup + dummyPunch.activeFrames + dummyPunch.cooldown;;
    dummyPunch.type = MID;
    dummyPunch.power = STRONG;
    dummyPunch.damage = 500;
    dummyPunch.width = 18;
    dummyPunch.height = 16;
    dummyPunch.top = 7;

    dummyMovelist[0] = dummyPunch;
}


