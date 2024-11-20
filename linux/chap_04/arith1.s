.globl _start

.section .text

_start:
    # Perform various artithmetic operations
    movq $3,   %rdi              # rdi = 3
    movq $2,   %rax              # rax = 2
    addq %rdi, %rax              # rax = rax + rdi = 3 + 2 = 5
    mulq %rdi                    # rax = rax * rdi = 3 * 5 = 15
    movq %rax, %rdi              # rdi = rax = 15

    # Set the exit code
    movq $60,  %rax

    # Perform the system call
    syscall
