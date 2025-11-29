#include "gba.h"
#include "mode0.h"
#include "mode4.h"
#include "print.h"
#include "analogSound.h"
#include "digitalSound.h"

#include "LightningPandemonium.h"

#include "gameTiles.h"

#include "start.h"
#include "start2.h"
#include "css.h"
#include "instructions.h"

#include "stage1.h"
#include "stage1Tiles.h"

#include "stage2SkyBG.h"
#include "train.h"
#include "stage2FullBackground.h"
#include "stage2Train.h"

#include "stage3.h"
#include "stage3Tileset.h"

#include "pause.h"
#include "win.h"
#include "lose.h"
#include "ui.h"

#include "sprites.h"
#include "spritesheet.h"

#include "game.h"
#include "attacks.h"


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
        buttons = REG_BUTTONS;

        //Sets hOff for centered camera
        if (state == STAGE2 || (state == PAUSE && prevState == STAGE2)) {
            REG_BG2HOFF = hOff;
            REG_BG3HOFF = bgScroll;
        } else {
            REG_BG3HOFF = hOff;
        }

        //State machine
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
    //playSoundA(LightningPandemonium_data, LightningPandemonium_length - 1, 1);

    
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    initAttacks();
    goToStart();

}

void goToStart() {
    hOff = 0;
    switchMode4();
    DMANow(3, startPal, BG_PALETTE, startPalLen / 2);
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
    if (BUTTON_PRESSED(BUTTON_START)) {
        // goToCSS();
        goToInstructions();
    }
    if BUTTON_PRESSED(BUTTON_SELECT) {
        goToInstructions();
    }
}

void goToCSS() {
    switchMode0();
    REG_DISPCTL = MODE(0) | BG_ENABLE(3)| SPRITE_ENABLE;
    DMANow(3, gameTilesPal, BG_PALETTE, gameTilesPalLen / 2);
    DMANow(3, gameTilesTiles, &CHARBLOCK[0], gameTilesTilesLen / 2);
    DMANow(3, cssMap, &SCREENBLOCK[30], cssMapLen / 2);
    REG_BG3CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    state = CHARACTERSELECT;
}

void css() {
    if BUTTON_PRESSED(BUTTON_START) {
        initGame();
        goToStage1();
    }
}

void goToInstructions() {
    switchMode4();
    DMANow(3, instructionsPal, BG_PALETTE, instructionsPalLen / 3);
    drawFullscreenImage4(instructionsBitmap);
    state = INSTRUCTIONS;
}

void instructions() {
    if BUTTON_PRESSED(BUTTON_START) {
        // goToCSS();
        initGame();
        goToStage1();
    }
    if BUTTON_PRESSED(BUTTON_SELECT) {
        goToStart();
    }
}

void goToStage1() {
    switchMode0();
    // Wide background, will implement scrolling
    DMANow(3, gameTilesTiles, &CHARBLOCK[0], gameTilesTilesLen / 2);
    DMANow(3, stage1TilesTiles, &CHARBLOCK[1], stage1TilesTilesLen / 2);
    DMANow(3, stage1TilesPal, BG_PALETTE, stage1TilesPalLen / 2);
    DMANow(3, stage1Map, &SCREENBLOCK[30], stage1MapLen / 2);
    DMANow(3, uiMap, &SCREENBLOCK[29], uiMapLen / 2);
    REG_BG3CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) |BG_ENABLE(3) | SPRITE_ENABLE;
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
    DMANow(3, shadowOAM, OAM, 512);

    if BUTTON_PRESSED(BUTTON_START) {
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
    DMANow(3, stage2SkyBGPal, BG_PALETTE, stage2SkyBGPalLen / 2);
    DMANow(3, trainPal, &BG_PALETTE[16] , 16);
    DMANow(3, stage2SkyBGTiles, &CHARBLOCK[1], stage2SkyBGTilesLen / 2);
    DMANow(3, stage2FullBackgroundMap, &SCREENBLOCK[30], stage2FullBackgroundMapLen / 2);
    DMANow(3, trainTiles, &CHARBLOCK[2], trainTilesLen / 2);
    DMANow(3, stage2TrainMap, &SCREENBLOCK[20], stage2TrainMapLen / 2);

    // Change palrow for train
    for (int i = 0; i < stage2TrainMapLen; i++) {
        SCREENBLOCK[20].tilemap[i] |= TILEMAP_ENTRY_PALROW(1);   
    }

    REG_DISPCTL = 0;
    REG_BG3CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE | SPRITE_ENABLE;
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(20) | SPRITE_ENABLE;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
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
    DMANow(3, shadowOAM, OAM, 512);

    if BUTTON_PRESSED(BUTTON_START) {
        prevState = STAGE2;
        goToPause();
    }
    if (opp.health <= 0) {
        prevState = STAGE2;
        REG_DISPCTL |= !BG_ENABLE(2);
        goToStage3();
    }
    if (player.health <= 0) {
        goToLose();
    }
}

void goToStage3() {
    DMANow(3, stage3TilesetPal, BG_PALETTE, stage3TilesetPalLen / 2);
    DMANow(3, stage3TilesetTiles, &CHARBLOCK[1], stage3TilesetTilesLen / 2);
    DMANow(3, gameTilesTiles, &CHARBLOCK[0], gameTilesTilesLen / 2);
    DMANow(3, stage3Map, &SCREENBLOCK[20], stage3MapLen / 2);


    REG_DISPCTL = 0;
    REG_BG3CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_SIZE_WIDE | SPRITE_ENABLE;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(3) | SPRITE_ENABLE;
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
    DMANow(3, shadowOAM, OAM, 512);

    if BUTTON_PRESSED(BUTTON_START) {
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
    REG_DISPCTL |= BG_ENABLE(1);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24);
    state = PAUSE;
}

void pause() {
    if BUTTON_PRESSED(BUTTON_START) {
        if (prevState == STAGE1) {
            REG_DISPCTL &= ~BG_ENABLE(1);
            goToStage1();
        }
        if (prevState == STAGE2) {
            REG_DISPCTL &= ~BG_ENABLE(1);
            goToStage2();
        }
        if (prevState == STAGE3) {
            REG_DISPCTL &= ~BG_ENABLE(1);
            goToStage3();
        }
    }
    if BUTTON_PRESSED(BUTTON_SELECT) {
        goToStart();
    }
}

void goToWin() {
    hOff = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    switchMode4();
    DMANow(3, winPal, BG_PALETTE, winPalLen / 2);
    drawFullscreenImage4(winBitmap);
    state = WIN;
}

void win() {
    if BUTTON_PRESSED(BUTTON_START) {
        goToStart();
    }
}

void goToLose() {
    hOff = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    switchMode4();
    DMANow(3, losePal, BG_PALETTE, losePalLen / 2);
    drawFullscreenImage4(loseBitmap);
    state = LOSE;
}

void lose() {
    if BUTTON_PRESSED(BUTTON_START) {
        goToStart();
    }
}

void switchMode4() {
    //Sets splash screens for mode 4
    REG_DISPCTL = 0;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    //Clear front and back buffer
    DMANow(3, 0, FRONTBUFFER, DMA_SOURCE_FIXED | SCREENWIDTH * SCREENHEIGHT / 2);
    DMANow(3, 0, BACKBUFFER, DMA_SOURCE_FIXED | SCREENWIDTH * SCREENHEIGHT / 2);

}

void switchMode0() {
    //Sets screens and tiles for mode 0 states
    REG_DISPCTL = 0;
    REG_DISPCTL = MODE(0);
    DMANow(3, gameTilesPal, BG_PALETTE, gameTilesPalLen / 2);
    DMANow(3, gameTilesTiles, &CHARBLOCK[0], gameTilesTilesLen / 2);
    DMANow(3, cssMap, &SCREENBLOCK[30], cssMapLen / 2);
    DMANow(3, stage1Map, &SCREENBLOCK[27], stage1MapLen / 2);
    DMANow(3, stage3Map, &SCREENBLOCK[20], stage3MapLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[24], pauseMapLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, spritesheetPalLen / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}
