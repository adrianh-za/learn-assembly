.section .data
msg: .asciz "Bit %d = %d\n"

.extern printf

.section .text
.globl main
main:
    movq %rsp, %rbp #for correct debugging
    
    # Align stack properly for calling convention
    subq $32,   %rsp                        # Reserve 32 bytes by substract from 
    andq $-16,  %rsp                        # Align to 16-byte boundry (x86-x64 calling convention)
    
    # Load a 32-bit value into %r12 to check bits on
    movl $0b10101011111100110101100100110011, %r12d

    # Set the max bit position
    movq $31, %rdi
    
    
loop_start:
    
    # Determine bit value at position in %rdi
    movq %r12, %rax                # Copy %r12 to %rax
    movb %dil, %cl                 # Move position to %cl as SHRQ must be in %cl
    shrq %cl, %rax                 # Shift right by position
    andq $1, %rax                  # Isolate the least significant bit
    
    # Print the bit value
    movq %rdi, %rdx                # Set the position (1st specifier) into rdx
    movq %rax, %r8                 # Set the bit value (2nd specifier) into r8
    leaq msg(%rip), %rcx           # Set the message (format string) into rcx
    xorq %rax, %rax                # Clear %rax as required by calling conventions
    xorq %rbx, %rbx                # Clear %rbx as required by calling conventions
    call printf                    # Call printf
    
    dec %rdi                       # Decrement the loop counter
    jns loop_start                 # Jump to loop_start if %rdi is not negative
    
    # Restore stack and exit
    movq %rbp, %rsp
    xorq %rax, %rax                # Return 0
    ret
