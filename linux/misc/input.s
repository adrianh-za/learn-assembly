.global _start

# constants
.equ READ, 0
.equ STDIN, 0
.equ WRITE, 1
.equ STDOUT, 1
.equ EXIT, 60

.bss
    name: .skip 32                      # allocates 32 bytes for the car

# code
.text

# read name from stdin
_inputName:
    movq    $READ,  %rax                # read input
    movq    $STDIN, %rdi                # from stdin
    movq    $name,  %rsi                # buffer
    movq    $32,    %rdx                # buffer size
    syscall
    ret

# print name to stdout
_printName:
    movq    $WRITE,  %rax               # write data
    movq    $STDOUT, %rdi               # to stdout
    leaq    name,    %rsi               # data to output
    movq    $32,     %rdx               # data length
    syscall
    ret

# exits the app
_exit:
    movq    $EXIT, %rax                 # system call 60 is exit
    movq    $0,    %rdi                 # we want return code 0
    syscall
    ret

# start
_start:
    # convention, probably not needed in this instance
    pushq   %rbp                        # Save the old base pointer
    movq    %rsp, %rbp                  # Set the new base pointer

    call    _inputName                  # get name
    call    _printName                  # print name
    call    _exit                       # exit the app

    # convention, probably not needed in this instance
    movq    %rbp, %rsp                  # Restore the old stack pointer
    popq    %rbp                        # Restore the old base pointer
