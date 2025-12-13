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
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4

# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 160 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 344 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 60 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3

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
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





typedef __FILE FILE;



typedef _fpos_t fpos_t;





typedef __off_t off_t;




typedef _ssize_t ssize_t;



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 192 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 272 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 402 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 583 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 691 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 745 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 801 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 6 "main.c" 2
# 1 "analogSound.h" 1
# 257 "analogSound.h"

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
# 7 "main.c" 2
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
# 8 "main.c" 2

# 1 "LightningPandemonium.h" 1


extern const unsigned int LightningPandemonium_sampleRate;
extern const unsigned int LightningPandemonium_length;
extern const signed char LightningPandemonium_data[];
# 10 "main.c" 2

# 1 "gameTiles.h" 1
# 21 "gameTiles.h"
extern const unsigned short gameTilesTiles[8192];


extern const unsigned short gameTilesPal[256];
# 12 "main.c" 2

# 1 "start.h" 1
# 21 "start.h"
extern const unsigned short startBitmap[19200];


extern const unsigned short startPal[256];
# 14 "main.c" 2
# 1 "start2.h" 1
# 21 "start2.h"
extern const unsigned short start2Bitmap[19200];


extern const unsigned short start2Pal[256];
# 15 "main.c" 2
# 1 "css.h" 1







extern const unsigned short cssMap[1024];
# 16 "main.c" 2
# 1 "instructions.h" 1
# 21 "instructions.h"
extern const unsigned short instructionsBitmap[19200];


extern const unsigned short instructionsPal[256];
# 17 "main.c" 2
# 1 "instructions2.h" 1
# 21 "instructions2.h"
extern const unsigned short instructions2Bitmap[19200];


extern const unsigned short instructions2Pal[256];
# 18 "main.c" 2
# 1 "instructions3.h" 1
# 21 "instructions3.h"
extern const unsigned short instructions3Bitmap[19200];


extern const unsigned short instructions3Pal[256];
# 19 "main.c" 2
# 1 "instructions4.h" 1
# 21 "instructions4.h"
extern const unsigned short instructions4Bitmap[19200];


extern const unsigned short instructions4Pal[256];
# 20 "main.c" 2
# 1 "instructions5.h" 1
# 21 "instructions5.h"
extern const unsigned short instructions5Bitmap[19200];


extern const unsigned short instructions5Pal[256];
# 21 "main.c" 2

# 1 "stage1.h" 1







extern const unsigned short stage1Map[2048];
# 23 "main.c" 2
# 1 "stage1Tiles.h" 1
# 21 "stage1Tiles.h"
extern const unsigned short stage1TilesTiles[8192];


extern const unsigned short stage1TilesPal[256];
# 24 "main.c" 2

# 1 "stage2SkyBG.h" 1
# 21 "stage2SkyBG.h"
extern const unsigned short stage2SkyBGTiles[8192];


extern const unsigned short stage2SkyBGPal[256];
# 26 "main.c" 2
# 1 "train.h" 1
# 21 "train.h"
extern const unsigned short trainTiles[8192];


extern const unsigned short trainPal[256];
# 27 "main.c" 2
# 1 "stage2FullBackground.h" 1







extern const unsigned short stage2FullBackgroundMap[2048];
# 28 "main.c" 2
# 1 "stage2Train.h" 1







extern const unsigned short stage2TrainMap[2048];
# 29 "main.c" 2

# 1 "stage3.h" 1







extern const unsigned short stage3Map[2048];
# 31 "main.c" 2
# 1 "stage3Tileset.h" 1
# 21 "stage3Tileset.h"
extern const unsigned short stage3TilesetTiles[8192];


extern const unsigned short stage3TilesetPal[256];
# 32 "main.c" 2

# 1 "pause.h" 1







extern const unsigned short pauseMap[1024];
# 34 "main.c" 2
# 1 "win.h" 1
# 21 "win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 35 "main.c" 2
# 1 "lose.h" 1
# 21 "lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 36 "main.c" 2
# 1 "ui.h" 1







extern const unsigned short uiMap[1024];
# 37 "main.c" 2

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
# 39 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[8192];


extern const unsigned short spritesheetPal[256];
# 40 "main.c" 2
# 1 "changmoSheet.h" 1
# 21 "changmoSheet.h"
extern const unsigned short changmoSheetTiles[8192];


extern const unsigned short changmoSheetPal[256];
# 41 "main.c" 2
# 1 "dummySheet.h" 1
# 21 "dummySheet.h"
extern const unsigned short dummySheetTiles[8192];


extern const unsigned short dummySheetPal[256];
# 42 "main.c" 2

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
# 44 "main.c" 2



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
int playerWins;
int oppWins;
int instructPage;
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
    playSoundA(LightningPandemonium_data, LightningPandemonium_length - 100, 1);


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
    instructPage = 1;
}

void instructions() {
    if (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) {
        initGame();
        goToStage1();
    }
    if (!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) {
        goToStart();
    }
    if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
        if (instructPage == 5) {
            drawFullscreenImage4(instructions4Bitmap);
            instructPage = 4;
        } else if (instructPage == 4) {
            drawFullscreenImage4(instructions3Bitmap);
            instructPage = 3;
        } else if (instructPage == 3) {
            drawFullscreenImage4(instructions2Bitmap);
            instructPage = 2;
        } else if (instructPage == 2) {
            drawFullscreenImage4(instructionsBitmap);
            instructPage = 1;
        }
    }

    if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
        if (instructPage == 1) {
            drawFullscreenImage4(instructions2Bitmap);
            instructPage = 2;
        } else if (instructPage == 2) {
            drawFullscreenImage4(instructions3Bitmap);
            instructPage = 3;
        } else if (instructPage == 3) {
            drawFullscreenImage4(instructions4Bitmap);
            instructPage = 4;
        } else if (instructPage == 4) {
            drawFullscreenImage4(instructions5Bitmap);
            instructPage = 5;
        }
    }
}

void goToStage1() {
    switchMode0();

    opp.character = GINGER;
    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, stage1TilesTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, stage1TilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameTilesPal, &((unsigned short *)0x5000000)[32], 16);
    DMANow(3, stage1Map, &((SB*) 0x6000000)[30], (4096) / 2);
    DMANow(3, uiMap, &((SB*) 0x6000000)[28], (2048) / 2);
    (*(volatile unsigned short*) 0x400000E) = ((1) << 2) | ((30) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) |(1 << (8 + (3 % 4))) | (1 << 12);
    state = STAGE1;

    for (int i = 0; i < (2048); i++) {
        ((SB*) 0x6000000)[28].tilemap[i] |= (((2) & 15) << 12);
    }

    changeCharacters();
}

void stage1() {
    drawPortraits();
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    updateSupers();
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
        playerWins++;
        updateWins();
        initGame();
        if (playerWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            prevState = STAGE1;
            goToStage2();
        }
    }
    if (player.health <= 0) {
        oppWins++;
        updateWins();
        initGame();
        if (oppWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            goToLose();
        }
    }
}

void goToStage2() {
    opp.character = NEON;
    DMANow(3, stage2SkyBGPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, trainPal, &((unsigned short *)0x5000000)[16] , 16);
    DMANow(3, gameTilesPal, &((unsigned short *)0x5000000)[32], 16);
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
    changeCharacters();
}

void stage2() {
    bgScroll += 4;
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    updateSupers();
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
        playerWins++;
        updateWins();
        initGame();
        if (playerWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            prevState = STAGE2;
            (*(volatile unsigned short *)0x4000000) |= !(1 << (8 + (2 % 4)));
            goToStage3();
        }
    }
    if (player.health <= 0) {
        oppWins++;
        updateWins();
        initGame();
        if (oppWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            goToLose();
        }
    }
}

void goToStage3() {
    opp.character = NUJA;
    DMANow(3, stage3TilesetPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, stage3TilesetTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, gameTilesPal, &((unsigned short *)0x5000000)[32], 16);
    DMANow(3, gameTilesTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, stage3Map, &((SB*) 0x6000000)[20], (4096) / 2);

    for (int i = 0; i < (2048); i++) {
        ((SB*) 0x6000000)[28].tilemap[i] |= (((2) & 15) << 12);
    }

    (*(volatile unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short*) 0x400000E) = ((1) << 2) | ((20) << 8) | (1 << 14) | (1 << 12);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    if (prevState == STAGE2) {
        initGame();
    }
    state = STAGE3;
    changeCharacters();
}

void stage3() {
    updateHealthbars();
    checkPosition();
    updatePlayer();
    updateOpp();
    updateCamera();
    updateSupers();
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
        playerWins++;
        updateWins();
        initGame();
        if (playerWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            prevState = STAGE3;
            goToWin();
        }
    }
    if (player.health <= 0) {
        oppWins++;
        updateWins();
        initGame();
        if (oppWins >= 2) {
            playerWins = 0;
            oppWins = 0;
            player.meter = 0;
            opp.meter = 0;
            clearWins();
            goToLose();
        }
    }
}

void goToPause() {
    (*(volatile unsigned short *)0x4000000) |= (1 << (8 + (1 % 4)));
    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((24) << 8);
    state = PAUSE;

    for (int i = 0; i < (2048); i++) {
        ((SB*) 0x6000000)[24].tilemap[i] |= (((2) & 15) << 12);
    }
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
    DMANow(3, pauseMap, &((SB*) 0x6000000)[24], (2048) / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
