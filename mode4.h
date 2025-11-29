#ifndef GBA_MODE4_H
#define GBA_MODE4_H

#include "gba.h"

#define FRONTBUFFER ((unsigned short*) 0x06000000) // Beginning of front buffer
#define BACKBUFFER  ((unsigned short*) 0x0600A000) // Beginning of back buffer

void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);

#endif