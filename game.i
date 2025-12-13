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
    int top;
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
    NEON,
    GINGER,
    NUJA,
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
extern ATTACK changmoMovelist[20];

extern ATTACK dummyPunch;
extern ATTACK dummyMovelist[20];

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
# 1 "block.h" 1


extern const unsigned int block_sampleRate;
extern const unsigned int block_length;
extern const signed char block_data[];
# 10 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 11 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4

# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 344 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 160 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 374 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 52 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 90 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 131 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 147 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 158 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef long __daddr_t;



typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
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
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

typedef uint32_t _COND_T;
# 27 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 3
static inline void __libc_lock_init(_LOCK_T *lock) {
        *lock = ((_LOCK_T)0);
}

static inline void __libc_lock_close(_LOCK_T *lock ) {}

static inline void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock) {
        *lock = ((_LOCK_RECURSIVE_T){((_LOCK_T)0),0,0});
}

static inline void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock ) {}

extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);


static inline int __libc_cond_init(_COND_T *cond) {
        *cond = ((_COND_T)0);
}

extern int __libc_cond_signal(_COND_T *cond);
extern int __libc_cond_broadcast(_COND_T *cond);
extern int __libc_cond_wait(_COND_T *cond, _LOCK_T *lock, uint64_t timeout_ns);
extern int __libc_cond_wait_recursive(_COND_T *cond, _LOCK_RECURSIVE_T *lock, uint64_t timeout_ns);
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
typedef _LOCK_RECURSIVE_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 99 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 116 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 153 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  _ssize_t (*_read) (struct _reent *, void *,
        char *, size_t);
  _ssize_t (*_write) (struct _reent *, void *,
         const char *,
         size_t);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 270 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



extern __FILE __sf[3];

struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};

extern struct _glue __sglue;
# 306 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 580 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];




  struct __locale_t *_locale;





  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {



          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
# 649 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
   char _getlocalename_l_buf[32 ];
        } _reent;







    } _new;







  void (**_sig_func)(int);

  void *deviceData;
};
# 801 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;





extern struct _reent _impure_data ;





  struct _reent * __getreent (void);
# 921 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _atexit *__atexit;
extern struct _atexit __atexit0;

extern void (*__stdio_exit_handler) (void);

void _reclaim_reent (struct _reent *);

extern int _fwalk_sglue (struct _reent *, int (*)(struct _reent *, __FILE *),
    struct _glue *);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);



char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 137 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 159 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 191 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 202 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 225 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 265 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 286 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 324 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 341 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 12 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 1 3
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/time.h" 1 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef __intptr_t register_t;
# 97 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;




typedef __daddr_t daddr_t;


typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 155 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/sched.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/sched.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_timespec.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_timespec.h" 3
struct timespec {
 time_t tv_sec;
 long tv_nsec;
};

__uint64_t
timespec2nsec(const struct timespec *restrict ts);

__uint64_t
abstimespec2nsec(__clockid_t clock_id, const struct timespec *restrict ts);
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/sched.h" 2 3
# 56 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/sched.h" 3
struct sched_param {
  int sched_priority;
# 69 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/sched.h" 3
};
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 2 3






typedef struct __pthread_t *pthread_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef struct {
  void *stackaddr;
  int stacksize;





  struct sched_param schedparam;





  int detachstate;
} pthread_attr_t;
# 132 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef struct {
  int type;
  union {
    _LOCK_T normal;
    _LOCK_RECURSIVE_T recursive;
  };
} pthread_mutex_t;

typedef struct {
# 149 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 3
  int type;

} pthread_mutexattr_t;







typedef struct {
  clockid_t clock_id;
  _COND_T cond;
} pthread_cond_t;



typedef struct {
  clockid_t clock_id;



} pthread_condattr_t;



typedef __uint32_t pthread_key_t;

typedef struct {
  int status;
} pthread_once_t;







typedef struct {
  _LOCK_T lock;
  _COND_T cond;
  unsigned reload;
  unsigned counter;
  unsigned cycle;
} pthread_barrier_t;
typedef struct {



} pthread_barrierattr_t;
# 210 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef struct {
  _LOCK_T lock;
  _COND_T cond_r;
  _COND_T cond_w;
  uint32_t cnt_r : 30;
  uint32_t cnt_w : 2;
} pthread_rwlock_t;



typedef struct {



} pthread_rwlockattr_t;
# 222 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 223 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 1 3
# 58 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 3
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3







struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;






};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *restrict _s,
        size_t _maxsize, const char *restrict _fmt,
        const struct tm *restrict _t);







char *asctime_r (const struct tm *restrict,
     char *restrict);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *restrict,
     struct tm *restrict);
struct tm *localtime_r (const time_t *restrict,
     struct tm *restrict);


# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
void _tzset_r (struct _reent *);
# 158 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 1 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_sigset.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_sigset.h" 3
typedef unsigned long __sigset_t;
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 2 3





typedef __sigset_t sigset_t;
# 120 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
typedef void (*_sig_func_ptr)(int);

struct sigaction
{
 _sig_func_ptr sa_handler;
 sigset_t sa_mask;
 int sa_flags;
};
# 154 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
typedef struct sigaltstack {
  void *ss_sp;
  int ss_flags;
  size_t ss_size;
} stack_t;
# 7 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 2 3



typedef int sig_atomic_t;
# 22 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 3
struct _reent;

_sig_func_ptr _signal_r (struct _reent *, int, _sig_func_ptr);
int _raise_r (struct _reent *, int);


_sig_func_ptr signal (int, _sig_func_ptr);
int raise (int);
void psignal (int, const char *);



# 159 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3







int clock_settime (clockid_t clock_id, const struct timespec *tp);
int clock_gettime (clockid_t clock_id, struct timespec *tp);
int clock_getres (clockid_t clock_id, struct timespec *res);



int timer_create (clockid_t clock_id,
  struct sigevent *restrict evp,
 timer_t *restrict timerid);



int timer_delete (timer_t timerid);



int timer_settime (timer_t timerid, int flags,
 const struct itimerspec *restrict value,
 struct itimerspec *restrict ovalue);
int timer_gettime (timer_t timerid, struct itimerspec *value);
int timer_getoverrun (timer_t timerid);



int nanosleep (const struct timespec *rqtp, struct timespec *rmtp);
# 13 "game.c" 2

# 1 "changmoSheet.h" 1
# 21 "changmoSheet.h"

# 21 "changmoSheet.h"
extern const unsigned short changmoSheetTiles[8192];


extern const unsigned short changmoSheetPal[256];
# 15 "game.c" 2
# 1 "gingerSheet.h" 1
# 21 "gingerSheet.h"
extern const unsigned short gingerSheetTiles[8192];


extern const unsigned short gingerSheetPal[256];
# 16 "game.c" 2
# 1 "neonSheet.h" 1
# 21 "neonSheet.h"
extern const unsigned short neonSheetTiles[8192];


extern const unsigned short neonSheetPal[256];
# 17 "game.c" 2
# 1 "nujaSheet.h" 1
# 21 "nujaSheet.h"
extern const unsigned short nujaSheetTiles[8192];


extern const unsigned short nujaSheetPal[256];
# 18 "game.c" 2
# 1 "dummySheet.h" 1
# 21 "dummySheet.h"
extern const unsigned short dummySheetTiles[8192];


extern const unsigned short dummySheetPal[256];
# 19 "game.c" 2

PLAYER player;
PLAYER opp;

enum direction DIRECTION;

int hOff;
int frameCounter;
int damagedFrames;
int attackCooldown;

void initGame() {

    player.x = 160;
    player.y = 96;
    player.xVel = 1;
    player.yVel = 2;
    player.width = 16;
    player.height = 32;
    player.health = 1100;
    player.direction = RIGHT;
    player.attacking = 0;
    player.currentAttack = 0;
    player.oamIndex = 0;
    player.character = CHANGMO;
    player.inAir = 0;

    player.walkTime = 10;
    player.currentWalkFrame = 0;


    opp.x = 224;
    opp.y = 96;
    opp.xVel = 1;
    opp.yVel = 2;
    opp.width = 16;
    opp.height = 32;
    opp.health = 1100;
    opp.direction = LEFT;
    opp.attacking = 0;
    opp.currentAttack = 0;
    opp.oamIndex = 1;
    opp.inAir = 0;

    opp.walkTime = 10;
    opp.currentWalkFrame = 0;
}

void changeCharacters() {
    if (player.character == CHANGMO) {
        player.movelist = changmoMovelist;
        DMANow(3, changmoSheetTiles, &((CB*) 0x6000000)[4], 16384 / 2);
        DMANow(3, changmoSheetPal, ((u16 *)0x5000200), 16);
    }

    if (opp.character == DUMMY) {
        opp.movelist = dummyMovelist;
        DMANow(3, dummySheetTiles, &((CB*) 0x6000000)[5], 16384 / 2);
        DMANow(3, dummySheetPal, &((u16 *)0x5000200)[16], 16);
    }

    if (opp.character == GINGER) {
        opp.movelist = changmoMovelist;
        DMANow(3, gingerSheetTiles, &((CB*) 0x6000000)[5], 16384 / 2);
        DMANow(3, gingerSheetPal, &((u16 *)0x5000200)[16], 16);
    }

    if (opp.character == NEON) {
        opp.movelist = changmoMovelist;
        DMANow(3, neonSheetTiles, &((CB*) 0x6000000)[5], 16384 / 2);
        DMANow(3, neonSheetPal, &((u16 *)0x5000200)[16], 16);
    }

    if (opp.character == NUJA) {
        opp.movelist = changmoMovelist;
        DMANow(3, nujaSheetTiles, &((CB*) 0x6000000)[5], 16384 / 2);
        DMANow(3, nujaSheetPal, &((u16 *)0x5000200)[16], 16);
    }

    player.bodyColor = ((u16 *)0x5000200)[3];
    opp.bodyColor = ((u16 *)0x5000200)[19];
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
    shadowOAM[127].attr2 = ((((14) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);

    shadowOAM[126].attr0 = ((0) & 0xFF) | (0<<14);
    shadowOAM[126].attr1 = ((224) & 0x1FF) | (1<<14) | (1<<12);
    shadowOAM[126].attr2 = ((((14 + 16) * (32) + (0))) & 0x3FF) | (((1) & 0xF) <<12);
}

void updatePlayer() {


    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        if (player.health < 1100) {
            player.health += 100;
        }
    }

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
            player.inAir = 1;
        }

        if ((~(buttons) & ((1<<5))) && colorAt(player.left - player.xVel, player.top) == 1 && colorAt(player.left - player.xVel, player.bottom) == 1
            && !collision(player.left - player.xVel, player.top, player.width, player.height, opp.left, opp.top, opp.width, opp.height)
            && player.screenX > 0) {
            player.x -= player.xVel;
            player.walking = 1;
            if (player.direction == RIGHT && !player.inAir) {
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
            if (player.direction == LEFT && !player.inAir) {
                player.block = HIGH;
            } else {
                player.block = 0;
            }
        }

        if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = PUNCH;
            player.currentAttack = &player.movelist[0];
            player.currentAttack->hasHit = 0;
        }

        if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = KICK;
            player.currentAttack = &player.movelist[1];
            player.currentAttack->hasHit = 0;
        }

        if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8)))) && !player.inAir) {
            player.attacking = 1;
            player.buttonPressed = OVERHEAD;
            player.currentAttack = &player.movelist[4];
            player.currentAttack->hasHit = 0;
        }

        if ((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9)))) && player.meter == 100 && !player.inAir) {
            player.meter = 0;
            player.attacking = 1;
            player.buttonPressed = SUPER;
            player.currentAttack = &player.movelist[5];
            player.currentAttack->hasHit = 0;
        }
    }


    if (!player.attacking && !player.blocking && !player.inAir) {
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

            if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
                player.attacking = 1;
                player.buttonPressed = CRPUNCH;
                player.currentAttack = &player.movelist[2];
                player.currentAttack->hasHit = 0;
            }

            if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
                player.attacking = 1;
                player.buttonPressed = CRKICK;
                player.currentAttack = &player.movelist[3];
                player.currentAttack->hasHit = 0;
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
                        spawnHitbox(player.currentAttack, &opp, &player);
        }
    } else {
        player.attackTimer = 0;
    }


    if (colorAt(player.left, player.y + player.height) == 1) {
        player.y += player.yVel;
    } else {
        player.inAir = 0;
    }
}

void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ((player.y) & 0xFF) | (0<<14);
    shadowOAM[player.oamIndex].attr1 = ((player.screenX) & 0x1FF) | (2<<14);

    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr1 = shadowOAM[player.oamIndex].attr1 | (1<<12);
    }

    if (player.inAir) {
        shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (12))) & 0x3FF) | (((0) & 0xF) <<12);


    } else if (player.crouch) {
        shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (12))) & 0x3FF) | (((0) & 0xF) <<12);


        if (player.attacking && player.currentAttack != 0) {


            if (player.buttonPressed == CRKICK) {
                if (player.attackTimer <= player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (24))) & 0x3FF) | (((0) & 0xF) <<12);
                } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (28))) & 0x3FF) | (((0) & 0xF) <<12);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (24))) & 0x3FF) | (((0) & 0xF) <<12);
                }


            } else if (player.buttonPressed == CRPUNCH) {
                if (player.attackTimer <= player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
                } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
                }
            }
        }


    } else if (player.attacking && player.currentAttack != 0) {


        if (player.buttonPressed == PUNCH) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
            }


        } else if (player.buttonPressed == KICK) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (24))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (28))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (24))) & 0x3FF) | (((0) & 0xF) <<12);
            }


        } else if (player.buttonPressed == OVERHEAD) {
            if (player.attackTimer <= player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((8) * (32) + (16))) & 0x3FF) | (((0) & 0xF) <<12);
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                shadowOAM[player.oamIndex].attr2 = ((((8) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((8) * (32) + (20))) & 0x3FF) | (((0) & 0xF) <<12);
            }


        } else if (player.buttonPressed == SUPER) {
            if (player.attackTimer <= player.currentAttack->startup) {
                if (player.attackTimer <= 4) {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
                } else if (player.attackTimer <= 8) {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (6))) & 0x3FF) | (((0) & 0xF) <<12);
                } else if (player.attackTimer <= 12) {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (10))) & 0x3FF) | (((0) & 0xF) <<12);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (14))) & 0x3FF) | (((0) & 0xF) <<12);
                }
            } else if (player.attackTimer <= player.currentAttack->activeFrames + player.currentAttack->startup) {
                if (player.attackTimer <= player.currentAttack->startup + 10) {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (18))) & 0x3FF) | (((0) & 0xF) <<12);
                } else {
                    shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (22))) & 0x3FF) | (((0) & 0xF) <<12);
                }
            } else {
                shadowOAM[player.oamIndex].attr2 = ((((12) * (32) + (26))) & 0x3FF) | (((0) & 0xF) <<12);
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
        ((u16 *)0x5000200)[3] = player.bodyColor;
    }
}

void updateOpp() {


    int distance = abs((opp.x + opp.width/2) - (player.x + player.width/2));
    int oppAction = rand() % 100;
    int closeRange = 20;
    int midRange = 30;
    int farRange = 80;

    opp.walking = 0;
    opp.block = 0;


    if (opp.direction == RIGHT) {
        opp.left = opp.x;
    } else {
        opp.left = opp.x + 16;
    }
    opp.right = opp.left + opp.width - 1;
    opp.top = opp.y;
    opp.bottom = opp.top + opp.height - 1;


    if (!opp.attacking && !opp.crouch && !opp.blocking) {




        if (distance > farRange) {


            if (opp.direction == LEFT && oppAction < 70) {
                opp.x -= opp.xVel;
                opp.walking = 1;
            }

            else if (opp.direction == RIGHT && oppAction < 70) {
                opp.x += opp.xVel;
                opp.walking = 1;
            }
        }


        else if (distance > midRange && distance <= farRange) {


            if (oppAction < 40) {
                if (opp.direction == LEFT) opp.x -= opp.xVel;
                else opp.x += opp.xVel;
                opp.walking = 1;
            }

            else if (oppAction < 50 && !attackCooldown) {
                opp.attacking = 1;
                opp.buttonPressed = KICK;
                opp.currentAttack = &opp.movelist[1];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
        }


        else if (distance <= closeRange) {

            if (oppAction < 30 && !attackCooldown) {
                opp.attacking = 1;
                opp.buttonPressed = PUNCH;
                opp.currentAttack = &opp.movelist[0];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
            else if (oppAction < 50) {
                opp.crouch = 1;
                opp.block = LOW;
            }

            else if (oppAction < 60 && !attackCooldown) {
                opp.attacking = 1;
                opp.buttonPressed = OVERHEAD;
                opp.currentAttack = &opp.movelist[4];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }

            else if (oppAction < 65 && opp.meter == 100 && !attackCooldown) {
                opp.meter = 0;
                opp.attacking = 1;
                opp.buttonPressed = SUPER;
                opp.currentAttack = &opp.movelist[5];
                opp.currentAttack->hasHit = 0;
                attackCooldown = 60;
            }
            else if (oppAction < 80) {
                if (opp.direction == LEFT) opp.x += opp.xVel;
                else opp.x -= opp.xVel;
                opp.walking = 1;
            }
        }
    }


    if (!opp.attacking && opp.crouch) {
        if (oppAction < 20) {
            opp.block = LOW;
        } else {
            opp.crouch = 0;
        }
    }


    if (opp.attacking) {
        opp.attackTimer++;

        if (opp.attackTimer >= opp.currentAttack->totalFrames) {
            opp.attacking = 0;
            opp.currentAttack = 0;
        }
        else if (opp.attackTimer >= opp.currentAttack->startup + opp.currentAttack->activeFrames
            && opp.attackTimer <= opp.currentAttack->totalFrames - opp.currentAttack->cooldown)
        {
            spawnHitbox(opp.currentAttack, &player, &opp);
        }
    } else {
        opp.attackTimer = 0;
    }



    if (colorAt(opp.left, opp.y + opp.height) == 1) {
        opp.y += opp.yVel;
    } else {
        opp.inAir = 0;
    }


    if (opp.walking) {
        opp.walkTime--;
        if (opp.walkTime == 0) {
            opp.currentWalkFrame = (opp.currentWalkFrame + 1) % 3;
            opp.walkTime = 10;
        }
    } else {
        opp.currentWalkFrame = 0;
    }


    if (opp.blocking) {
        if (opp.direction == RIGHT) {
            opp.blocking = 0;
        }
        if (opp.direction == LEFT) {
            opp.blocking = 0;
        }
    }


    if (attackCooldown > 0) {
        attackCooldown--;
    } else {
        attackCooldown = 0;
    }
}


void drawOpp() {
    shadowOAM[opp.oamIndex].attr0 = ((opp.y) & 0xFF) | (0<<14);
    shadowOAM[opp.oamIndex].attr1 = ((opp.screenX) & 0x1FF) | (2<<14);

    if (opp.direction == LEFT) {
        shadowOAM[opp.oamIndex].attr1 = shadowOAM[opp.oamIndex].attr1 | (1<<12);
    }

    if (opp.inAir) {
        shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (12))) & 0x3FF) | (((1) & 0xF) <<12);


    } else if (opp.crouch) {
        shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (12))) & 0x3FF) | (((1) & 0xF) <<12);


        if (opp.attacking && opp.currentAttack != 0) {


            if (opp.buttonPressed == CRKICK) {
                if (opp.attackTimer <= opp.currentAttack->startup) {
                    shadowOAM[player.oamIndex].attr2 = ((((4 + 16) * (32) + (24))) & 0x3FF) | (((1) & 0xF) <<12);
                } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (28))) & 0x3FF) | (((1) & 0xF) <<12);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (24))) & 0x3FF) | (((1) & 0xF) <<12);
                }


            } else if (opp.buttonPressed == CRPUNCH) {
                if (opp.attackTimer <= opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (16))) & 0x3FF) | (((1) & 0xF) <<12);
                } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                    shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (20))) & 0x3FF) | (((1) & 0xF) <<12);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ((((4 + 16) * (32) + (16))) & 0x3FF) | (((1) & 0xF) <<12);
                }
            }
        }


    } else if (opp.attacking && opp.currentAttack != 0) {


        if (opp.buttonPressed == PUNCH) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (16))) & 0x3FF) | (((1) & 0xF) <<12);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (20))) & 0x3FF) | (((1) & 0xF) <<12);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (16))) & 0x3FF) | (((1) & 0xF) <<12);
            }


        } else if (opp.buttonPressed == KICK) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (24))) & 0x3FF) | (((1) & 0xF) <<12);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (28))) & 0x3FF) | (((1) & 0xF) <<12);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (24))) & 0x3FF) | (((1) & 0xF) <<12);
            }


        } else if (opp.buttonPressed == OVERHEAD) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((8 + 16) * (32) + (16))) & 0x3FF) | (((1) & 0xF) <<12);
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                shadowOAM[opp.oamIndex].attr2 = ((((8 + 16) * (32) + (20))) & 0x3FF) | (((1) & 0xF) <<12);
            } else {
                shadowOAM[opp.oamIndex].attr2 = ((((8 + 16) * (32) + (20))) & 0x3FF) | (((1) & 0xF) <<12);
            }


        } else if (opp.buttonPressed == SUPER) {
            if (opp.attackTimer <= opp.currentAttack->startup) {
                if (opp.attackTimer <= 4) {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (2))) & 0x3FF) | (((1) & 0xF) <<12);
                } else if (opp.attackTimer <= 8) {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (6))) & 0x3FF) | (((1) & 0xF) <<12);
                } else if (opp.attackTimer <= 12) {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (10))) & 0x3FF) | (((1) & 0xF) <<12);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (14))) & 0x3FF) | (((1) & 0xF) <<12);
                }
            } else if (opp.attackTimer <= opp.currentAttack->activeFrames + opp.currentAttack->startup) {
                if (opp.attackTimer <= opp.currentAttack->startup + 10) {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (18))) & 0x3FF) | (((1) & 0xF) <<12);
                } else {
                    shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (22))) & 0x3FF) | (((1) & 0xF) <<12);
                }
            } else {
                shadowOAM[opp.oamIndex].attr2 = ((((12 + 16) * (32) + (26))) & 0x3FF) | (((1) & 0xF) <<12);
            }
        }

    } else if (opp.walking) {
        shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (4 * opp.currentWalkFrame))) & 0x3FF) | (((1) & 0xF) <<12);
    } else {

        shadowOAM[opp.oamIndex].attr2 = ((((0 + 16) * (32) + (0))) & 0x3FF) | (((1) & 0xF) <<12);
    }
    if (opp.damaged > 0) {
        ((u16 *)0x5000200)[19] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        opp.damaged++;
        if (opp.damaged > 3) {
            opp.damaged = 0;
        }
    } else {
        ((u16 *)0x5000200)[19] = opp.bodyColor;
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


void spawnHitbox (ATTACK *attack, PLAYER *target, PLAYER *user) {
    if (collision(attack->x, attack->y, attack->width, attack->height, target->left, target->top, target->width, target->height)
        && attack->hasHit == 0) {

        if (target->block == attack->type || (target->block && attack->type == MID)) {
            target->blocking = 1;
            attack->hasHit = 1;
            if (user->meter < 100) {
                user->meter += 5;
            }
            playSoundB(block_data, block_length - 25, 0);

        } else {
            target->health -= attack->damage;
            target->damaged = 1;
            attack->hasHit = 1;
            if (user->meter < 100) {
                user->meter += 10;
            }
            if (target->meter < 100) {
                target->meter += 5;
            }
            playSoundB(hit_data, hit_length - 25, 0);
        }
        target->incomingAttack = attack;
    }
}


void calculateAttackHitboxes() {
    player.currentAttack->y = player.top + player.currentAttack->top;

    opp.currentAttack->y = opp.top + opp.currentAttack->top;


    if (player.attacking && player.currentAttack) {
        if (player.direction == RIGHT) {
            player.currentAttack->x = player.right;
        } else if (player.direction == LEFT) {
            player.currentAttack->x = player.left - player.currentAttack->width;
        }
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
        ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((0) & 1023);
    }


    for (int i = 0; i < 11; i++) {
        ((SB*) 0x6000000)[28].tilemap[32 + 17 + i] = ((0) & 1023);
    }

    while (playerCopy > 0) {

        if (playerCopy >= 100) {
            ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((162) & 1023) | (((2) & 15) << 12);
            playerCopy -= 100;

        } else if (playerCopy >= 75) {
            ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((194) & 1023) | (((2) & 15) << 12);
            playerCopy -= 75;

        } else if (playerCopy >= 50) {
            ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((226) & 1023) | (((2) & 15) << 12);
            playerCopy -= 50;

        } else if (playerCopy >= 25) {
            ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((258) & 1023) | (((2) & 15) << 12);
            playerCopy -= 25;

        } else {
            ((SB*) 0x6000000)[28].tilemap[32 + 12 - i] = ((0) & 1023) | (((2) & 15) << 12);
            playerCopy = 0;
        }
        i++;
    }

    while (oppCopy > 0) {

        if (oppCopy >= 100) {
            ((SB*) 0x6000000)[28].tilemap[32 + 17 + j] = ((162) & 1023) | (1 << 10) | (((2) & 15) << 12);
            oppCopy -= 100;

        } else if (oppCopy >= 75) {
            ((SB*) 0x6000000)[28].tilemap[32 + 17 + j] = ((194) & 1023) | (1 << 10) | (((2) & 15) << 12);
            oppCopy -= 75;

        } else if (oppCopy >= 50) {
            ((SB*) 0x6000000)[28].tilemap[32 + 17 + j] = ((226) & 1023) | (1 << 10) | (((2) & 15) << 12);
            oppCopy -= 50;

        } else if (oppCopy >= 25) {
            ((SB*) 0x6000000)[28].tilemap[32 + 17 + j] = ((258) & 1023) | (1 << 10) | (((2) & 15) << 12);
            oppCopy -= 25;

        } else {
            ((SB*) 0x6000000)[28].tilemap[32 + 17 + j] = ((0) & 1023) | (1 << 10) | (((2) & 15) << 12);
            oppCopy = 0;
        }
        j++;
    }
}

void updateSupers() {
    if (player.meter > 100) player.meter = 100;
    if (opp.meter > 100) opp.meter = 100;

    int playerCopy = player.meter;
    int oppCopy = opp.meter;

    int segments = 5;
    int segmentSize = 20;


    for (int i = 0; i < segments; i++) {
        int value = playerCopy - (i * segmentSize);

        u16 tile;
        if (value >= 20) tile = ((160) & 1023);
        else if (value >= 10) tile = ((192) & 1023);
        else if (value >= 5) tile = ((224) & 1023);
        else tile = ((0) & 1023);

        ((SB*) 0x6000000)[28].tilemap[(32 * 17) + 1 + i] = tile | (((2) & 15) << 12);
    }


    for (int j = 0; j < segments; j++) {
        int value = oppCopy - (j * segmentSize);

        u16 tile;
        if (value >= 20) tile = ((160) & 1023);
        else if (value >= 10) tile = ((192) & 1023);
        else if (value >= 5) tile = ((224) & 1023);
        else tile = ((0) & 1023);

        ((SB*) 0x6000000)[28].tilemap[(32 * 17) + 28 - j] = tile | (1 << 10) | (((2) & 15) << 12);
    }
}


void updateWins() {
    if (playerWins == 1) {
        ((SB*) 0x6000000)[28].tilemap[108] = ((130) & 1023) | (((2) & 15) << 12);
    }
    if (playerWins == 2) {
        ((SB*) 0x6000000)[28].tilemap[107] = ((130) & 1023) | (((2) & 15) << 12);
    }

    if (oppWins == 1) {
        ((SB*) 0x6000000)[28].tilemap[113] = ((130) & 1023) | (((2) & 15) << 12);
    }
    if (oppWins == 2) {
        ((SB*) 0x6000000)[28].tilemap[114] = ((130) & 1023) | (((2) & 15) << 12);
    }
}

void clearWins() {
    ((SB*) 0x6000000)[28].tilemap[108] = ((129) & 1023) | (((2) & 15) << 12);
    ((SB*) 0x6000000)[28].tilemap[107] = ((129) & 1023) | (((2) & 15) << 12);
    ((SB*) 0x6000000)[28].tilemap[113] = ((129) & 1023) | (((2) & 15) << 12);
    ((SB*) 0x6000000)[28].tilemap[114] = ((129) & 1023) | (((2) & 15) << 12);
}
