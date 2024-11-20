# My first program.  This is a comment.

.globl _start

.section .text

_start:
    movq $60, %rax      # 60 is the syscall number for exit
    movq $72, %rdi      # This is the exit status
    syscall             # make the syscall
