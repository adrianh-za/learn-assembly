.global _start

.section .data
first_value:
    .quad 4

second_value:
    .quad 6

.section .text
_start:
    movq first_value,  %rdi
    addq second_value, %rdi             # first_value + second_value = rdi = return value

    movq $60, %rax                      # system exit
    syscall
