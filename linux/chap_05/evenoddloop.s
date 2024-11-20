.global _start

# Even or Odd
# return 1 for even, return 0 for odd
# EG: 21 will return 1

.section .text

_start:
    movq $21, %rax                      # the divident
    movq $2,  %rbx                      # the divider
    movq $0,  %rdx                      # init to zero (NB!)

    # Will divide by 2. Zero remainder will mean number is even, else number is odd
    divq %rbx                           # rax / rbx  = rax rem rdx

    cmpq $0, %rdx                       # Compare remainder to 0
    je   even                           # Jump if remainder (rdx) = 0 (even number)
    jne  odd                            # Jump if remainder (rdx) != 0 (odd number)

even:
    movq $0, %rdi                       # set output to 0 for even
    jmp complete

odd:
    movq $1, %rdi                       # set output to 1 for odd
    jmp complete

complete:
    movq $60,   %rax                    # Exit call
    syscall
