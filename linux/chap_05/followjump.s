.section .text
.globl _start
_start:
    movq %rsp,  %rbp                    # for correct debugging

    movq $25,   %rax                    # rax = 25
    movq $0,    %rbx
    jmp  thelabel

thelabel:
    movq %rax,  %rbx                    # rbx,rax = 25
    jmp  there

there:
    addq $5,    %rbx                    # rbx = 30 = (5 + 25)
    jmp  label1

label1:
    addq %rbx,  %rax                    # rax = 55 = (rbx + rax) = (30 + 25)
    movq $5,    %rbx                    # rbx = 5
    jmp  here

here:
    divq %rbx                           # rax = 55/5 = rax/rbx = 11
    jmp  somewhere

somewhere:
    movq %rax,  %rdi                    # rdi = 11
    jmp anotherlabel

anotherlabel:
    movq $60,   %rax                    # rax = 60
    jmp  labellabel

labellabel:
    syscall
