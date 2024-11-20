.global _start

# Calculator to calculate rbx^rcx
# eg: 2^3 = 8
# eg: 3^4 = 81

.section .text

_start:
    movq $3, %rbx                       # will hold the base
    movq $4, %rcx                       # will hold the exponent (counter)
    movq $1, %rax                       # will hold the accumalated result

    cmpq $0, %rcx                       # check if counter is zero, as then we are complete
    je complete                         # jump if the above instruction is equal (true)

mainloop:
    mulq %rbx                           # rax = rbx * rax

    # LOOPQ uses the %rcx register as its loop counter. Every time LOOPQ is executed, it decrements %rcx by 1 and checks if %rcx is zero. 
    # If %rcx is not zero, the loop continues to the target label; if it is zero, the loop exits.
    loopq mainloop

complete:
    movq %rax,  %rdi                    # Store accumalated result in rdi so it can be returned
    movq $60,   %rax                    # Exit call
    syscall
