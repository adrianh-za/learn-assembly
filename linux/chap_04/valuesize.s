.globl _start

.section .text

_start:
    # Perform various artithmetic operations
    movw $0b0000000100000010, %bx       # bx = 258 (bh = 1, bl = 2)
    addb %bh, %bl                       # bx = bx + bh = 258 + 1 = 259
    movb $0,  %bh                       # This is irrelavant as the exit code only use bl

    movq %rbx, %rdi                     # rdi = rbx = 3

    # Set the exit code
    movq $60, %rax

    # Perform the system call
    syscall
