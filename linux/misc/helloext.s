.global _start

.data

# welcome message
message:
    .ascii  "Hello, world\n"

# constants
.equ STDOUT, 1
.equ WRITE, 1
.equ EXIT, 60

# code
.text

# prints out the welcome message
_printMessage:
    movq    $WRITE,  %rax               # write data
    movq    $STDOUT, %rdi               # to stdout
    movq    $message, %rsi              # data to output (copy address into rsi)
    #leaq    message, %rsi              # data to output (loads the effective address into rsi, can be used for address calcs)
    movq    $13, %rdx                   # data length
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

    call    _printMessage               # print the message
    call    _exit                       # exit the app

    # convention, probably not needed in this instance
    movq    %rbp, %rsp                  # Restore the old stack pointer
    popq    %rbp                        # Restore the old base pointer
