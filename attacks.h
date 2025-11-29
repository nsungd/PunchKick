#ifndef ATTACKS_H
#define ATTACKS_H

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

//Array containing attacks, not implemented
extern ATTACK attacks[100];

//Power of attack, used for knockback/knockdown, not implemented
enum power{
    WEAK,
    MED,
    STRONG,
}; 
extern enum power POWER;

//Type of attack
enum type {
    HIGH = 1,
    LOW,
    MID,
    GRAB
}; 
extern enum type TYPE;

//Characters
enum character {
    DUMMY,
    CHANGMO,
};
extern enum character CHARACTER;

//Keeps track of what attack type the player/opponent uses
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

#endif 
