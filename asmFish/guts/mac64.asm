
; reading and writing
extrn _read
extrn _write
extrn _fstat
extrn _open
extrn _close
stdin  = 0
stdout = 1
stderr = 2

struct timespec
  tv_sec  rq 1
  tv_nsec rq 1
ends

; for stat stucture, see line 309 of
; https://opensource.apple.com/source/xnu/xnu-3248.60.10/bsd/sys/stat.h
struct stat
  st_dev        rd 1
  st_mode       rw 1
  st_nlink      rw 1
  st_ino        rq 1
  st_uid        rd 1
  st_gid        rd 1
  st_rdev       rd 1
                rd 1            ; padding for alignment of next member
  st_atimespec      timespec
  st_mtimespec      timespec
  st_ctimespec      timespec
  st_birthtimespec  timespec
  st_size       rq 1            ; stat.st_size = 96
  st_blocks     rq 1
  st_blksize    rd 1
  st_flags      rd 1
  st_gen        rd 1
  st_lspare     rd 1
  st_qspare     rq 2
ends                            ; sizeof.stat  = 144

; timing
extrn _clock_gettime
extrn _nanosleep
CLOCK_MONOTONIC = 1

; memory
extrn _malloc
extrn _free
extrn _mmap
extrn _munmap

; threads
extrn _exit
extrn _pthread_create
extrn _pthread_join
extrn _pthread_exit
extrn _pthread_mutex_init
extrn _pthread_mutex_lock
extrn _pthread_mutex_unlock
extrn _pthread_mutex_destroy
extrn _pthread_cond_init
extrn _pthread_cond_signal
extrn _pthread_cond_wait
extrn _pthread_cond_destroy
sizeof.pthread_t = 16           ; only 8, but 16 for alignment
sizeof.pthread_mutex_t = 64     ; guess
sizeof.pthread_cond_t = 64      ; another guess



_COMM_PAGE64_BASE_ADDRESS = 0x00007fffffe00000
_COMM_PAGE_START_ADDRESS  = 0x00007fffffe00000

_COMM_PAGE_TIME_DATA_START      = _COMM_PAGE_START_ADDRESS+0x050 ; base of offsets below (_NT_SCALE etc)
_COMM_PAGE_NT_TSC_BASE          = _COMM_PAGE_START_ADDRESS+0x050 ; used by nanotime()
_COMM_PAGE_NT_SCALE             = _COMM_PAGE_START_ADDRESS+0x058 ; used by nanotime()
_COMM_PAGE_NT_SHIFT             = _COMM_PAGE_START_ADDRESS+0x05c ; used by nanotime()
_COMM_PAGE_NT_NS_BASE           = _COMM_PAGE_START_ADDRESS+0x060 ; used by nanotime()
_COMM_PAGE_NT_GENERATION        = _COMM_PAGE_START_ADDRESS+0x068 ; used by nanotime()
_COMM_PAGE_GTOD_GENERATION      = _COMM_PAGE_START_ADDRESS+0x06c ; used by gettimeofday()
_COMM_PAGE_GTOD_NS_BASE         = _COMM_PAGE_START_ADDRESS+0x070 ; used by gettimeofday()
_COMM_PAGE_GTOD_SEC_BASE        = _COMM_PAGE_START_ADDRESS+0x078 ; used by gettimeofday()
_COMM_PAGE_END                  = _COMM_PAGE_START_ADDRESS+0xfff ; end of common page

stdin  = 0 
stdout = 1 
stderr = 2 

_NT_TSC_BASE            = 0
_NT_SCALE               = 8
_NT_SHIFT               = 12
_NT_NS_BASE             = 16
_NT_GENERATION          = 24
_GTOD_GENERATION        = 28
_GTOD_NS_BASE           = 32
_GTOD_SEC_BASE          = 40

sys_exit          =   1 + (2 shl 24)
sys_fork          =   2 + (2 shl 24)
sys_read          =   3 + (2 shl 24)
sys_write         =   4 + (2 shl 24)
sys_open          =   5 + (2 shl 24)
sys_close         =   6 + (2 shl 24)
sys_munmap        =  73 + (2 shl 24)
sys_select        =  93 + (2 shl 24)
sys_gettimeofday  = 116 + (2 shl 24)
sys_fstat         = 189 + (2 shl 24)
sys_mmap          = 197 + (2 shl 24)
sys_poll          = 230 + (2 shl 24)

VM_FLAGS_SUPERPAGE_SIZE_2MB = 1 shl 16

O_RDONLY= 00000000o 
O_WRONLY= 00000001o 
O_RDWR= 00000002o 
O_CREAT= 00000100o 

PROT_NONE       = 0x00
PROT_READ       = 0x01
PROT_WRITE      = 0x02
PROT_EXEC       = 0x04

MAP_SHARED      = 0x0001 
MAP_PRIVATE     = 0x0002
MAP_FILE        = 0x0000 
MAP_FIXED       = 0x0010
MAP_ANON        = 0x1000

