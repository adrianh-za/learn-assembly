.global _start

.section .data
first_value:
    .quad 4

second_value:
    .quad 6

final_result:
    .quad 0

.section .text
_start:
    movq first_value,   %rbx
    movq second_value,  %rcx

    addq %rbx, %rcx                     # first_value + second_value = rcx

    movq %rcx, final_result             # Store result in final_result

    movq $60, %rax                      # system exit
    movq final_result, %rdi             # set the return value
    syscall
