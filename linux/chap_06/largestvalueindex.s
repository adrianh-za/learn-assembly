.global _start

.section .data
numbers_length:                         # amount of elements in numbers array
    .quad 7
numbers:                                # the numbers array
    .quad 5, 20, 33, 80, 52, 10, 1


### Find the largest value in the array ###
.section .text
_start:
    ### Initialise the registers ###
    # set the array length
    movq numbers_length, %rcx

    # the pointer to first element of array
    movq $0, %rbx

    # use %rdi to hold the high-value (will be set during loop)
    movq $0, %rdi

    ### Check Preconditions ###
    # if no numbers left, then stop
    cmp $0, %rcx
    je  endloop

mainloop:
    # Get element value based on index
    movq numbers( , %rbx, 8), %rax                  # addr(numbers) + %rbx  * 8

    # if not bigger than current high-value, move to end of loop
    cmp %rdi, %rax
    jbe loopcontrol

    # value is bigger, store as lastest high-value
    movq %rax, %rdi

loopcontrol:
    # move pointer %rbx to next elment
    incq %rbx

    # decrement the counter (decrements %rcx and skips jump on zero)
    loopq mainloop

    ### Cleanup and exit ###
endloop:
    movq $60, %rax
    syscall
