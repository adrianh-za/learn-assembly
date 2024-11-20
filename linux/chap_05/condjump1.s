.global _start

# Calculator to calculate rbx^rcx
# eg: 2^3 = 8
# eg: 3^4 = 81

.section .text

_start:
    movq $3, %rbx                       # will hold the base
    movq $4, %rcx                       # will hold the exponent (counter)
    movq $1, %rax                       # will hold the accumalated result

mainloop:
    addq $0, %rcx                       # Add zero so we can check eflags immediately.  mov will not set eflags, hence th add

    jz complete                         # if exponent (counter) is zero, we are complete

    mulq %rbx                           # rax = rbx * rax
    decq %rcx                           # decrement the exponent (counter)
    jmp mainloop

complete:
    movq %rax,  %rdi                    # Store accumlated result in rdi so it can be returned
    movq $60,   %rax                    # Exit call
    syscall
