#ifndef GAME_H
#define GAME_H

#include "attacks.h"

#define STAGE_WIDTH 416

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

#endif