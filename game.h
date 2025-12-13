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
    int inAir;
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

    int bodyColor;

    ATTACK *movelist;

    ATTACK *currentAttack;
    ATTACK *incomingAttack;
} PLAYER;

enum direction {
    LEFT,
    RIGHT
};
extern enum direction DIRECTION;

enum oppState {
    IDLE,
    APPROACHING,
    ATTACKING,
    RETREATING,
};
extern enum oppState OPPSTATE;

extern int stage;
extern int hOff;
extern int playerWins;
extern int oppWins;

extern PLAYER player;
extern PLAYER opp;


void initGame();
void updatePlayer();
void updateOpp();
void updateCamera();
void drawPlayer();
void drawOpp();
void calculateAttackHitboxes();
void spawnHitbox(ATTACK *attack, PLAYER *target, PLAYER *user);
void checkPosition();
void drawPortraits();
void updateHealthbars();
void updateWins();
void clearWins();
void changeCharacters();
void updateSupers();

inline unsigned char colorAt(int x, int y);

#endif