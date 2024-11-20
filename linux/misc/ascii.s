.global _start

.data

# constants
.equ STDOUT, 1
.equ WRITE, 1
.equ EXIT, 60
.equ MIN_ASCII, 32
.equ MAX_ASCII, 127

# buffer to hold the ASCII character buffer:
buffer: .asciz "\n"

# code
.text

# prints out the welcome message
printAscii:
    movq    $WRITE,  %rax               # write data
    movq    $STDOUT, %rdi               # to stdout
    movq    $buffer, %rsi               # data to output (copy address into rsi)
    movq    $1,      %rdx               # data length
    syscall
    ret

# exits the app
exit:
    movq    $EXIT, %rax                 # system call 60 is exit
    xor     %rdi, %rdi                  # we want return code 0
    syscall
    ret


# start
_start:
    # convention, probably not needed in this instance
    pushq   %rbp                        # Save the old base pointer
    movq    %rsp, %rbp                  # Set the new base pointer

    movq    $MIN_ASCII, %r12            # ascii counter, start a first printable char
    movq    $MAX_ASCII, %r13            # last ascii printable char

# loop to print out ascii chars
loop:
    call    printAscii                 # prints the current char in %rcx

    incq    %r12                        # increment the ascii counter
    movb    %r12b, buffer               # store the value in the char buffer

    cmpq    %r13, %r12                  # compare the current ascii counter to max ascii
    je      endloop                     # jump if max reached

    jmp     loop                        # process next ascii char

# endloop and exit
endloop:
    call    exit                       # exit the app

    # convention, probably not needed in this instance
    movq    %rbp, %rsp                  # Restore the old stack pointer
    popq    %rbp                        # Restore the old base pointer
