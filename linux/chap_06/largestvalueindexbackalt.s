.global _start

.section .data
numbers_length:                         # amount of elements in numbers array
    .quad 7
numbers:                                # the numbers array
    .quad 105, 20, 33, 80, 52, 10, 190


### Find the largest value in the array ###
.section .text
_start:
    # set the array length
    movq numbers_length, %rcx

    # use %rdi to hold the high-value (will be set during loop)
    movq $0, %rdi

### A basic WHILE loop ###
mainloop:
    # if no numbers left, then exit loop
    cmp $0, %rcx
    je  endloop

    # Get element value based on index
    movq numbers( , %rcx, 8), %rax                  # addr(numbers) + %rbx  * 8
    decq %rcx

    # if not bigger than current high-value, move to next loop
    cmp %rdi, %rax
    jbe mainloop

    # value is bigger, store as lastest high-value and then move to next loop
    movq %rax, %rdi
    jmp mainloop

### Exit and return ###
endloop:
    movq $60, %rax
    syscall
