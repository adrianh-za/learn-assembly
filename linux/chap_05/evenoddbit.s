.global _start

# Even or Odd
# return 0 for even, return 1 for odd
# EG: 21 will return 1

.section .text

_start:
    movq $21,   %rax                    # the number to check for
    andq $1,    %rax

    cmpq $0,    %rax                    # Compare remainder to 0
    movq %rax,  %rdi                    # Store the result (0 for even, 1 for add)

    movq $60,   %rax                    # Exit call
    syscall
