.section .data 
msg: .asciz "bit %d = %d\n"

.extern printf

.section .text
.globl main
main:
    movq %rsp, %rbp #for correct debugging
    
    # Align stack properly for calling convention
    subq $32,   %rsp                        # Reserve 32 bytes by substract from 
    andq $-16,  %rsp                        # Align to 16-byte boundry  (x86-x64 calling convention)

    # Do some bitwise stuff
    movq $0,    %r12
    movw $0b1010000101010011,  %r12         # %di = 8531

    # bit 16 = 1
    movq %r12,  %rax
    andq $0b1000000000000000,  %rax
    shrq $15,   %rax
    movq $15,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 15 = 0
    movq %r12,  %rax
    andq $0b0100000000000000,  %rax
    shrq $14,   %rax
    movq $14,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 14 = 1
    movq %r12,  %rax
    andq $0b0010000000000000,  %rax
    shrq $13,   %rax
    movq $13,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 13 = 0
    movq %r12,  %rax
    andq $0b0001000000000000,  %rax
    shrq $12,   %rax
    movq $12,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 12 = 1
    movq %r12,  %rax
    andq $0b0000100000000000,  %rax
    shrq $11,   %rax
    movq $11,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 11 = 0
    movq %r12,  %rax
    andq $0b0000010000000000,  %rax
    shrq $10,   %rax
    movq $10,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 10 = 1
    movq %r12,  %rax
    andq $0b0000001000000000,  %rax
    shrq $9,    %rax
    movq $9,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 9 = 0
    movq %r12,  %rax
    andq $0b0000000100000000,  %rax
    shrq $8,    %rax
    movq $8,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 8 = 1
    movq %r12,  %rax
    andq $0b0000000010000000,  %rax
    shrq $7,    %rax
    movq $7,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 7 = 0
    movq %r12,  %rax
    andq $0b0000000001000000,  %rax
    shrq $6,    %rax
    movq $6,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 6 = 1
    movq %r12,  %rax
    andq $0b0000000000100000,  %rax
    shrq $5, %rax
    movq $5,   %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 5 = 0
    movq %r12,  %rax
    andq $0b0000000000010000,  %rax
    shrq $4,    %rax
    movq $4,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 4 = 1
    movq %r12,  %rax
    andq $0b0000000000001000,  %rax
    shrq $3,    %rax
    movq $3,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 3 = 0
    movq %r12,  %rax
    andq $0b0000000000000100,  %rax
    shrq $2,    %rax
    movq $2,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 2 = 1
    movq %r12,  %rax
    andq $0b0000000000000010,  %rax
    shrq $1,    %rax
    movq $1,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # bit 1 = 0
    movq %r12,  %rax
    andq $0b0000000000000001,  %rax
    shrq $0,    %rax
    movq $0,    %rdx                            # Set the bit number (1st specifier)
    movq %rax,  %r8                             # Set the bit value (2nd specifier)
    movq $msg,  %rcx                            # Set the format message
    xorq %rax,  %rax                            # Clear rax as required by calling conventions
    call printf

    # Restore stack and exit
    movq %rbp, %rsp
    movq $0, %rax                   # Clear rax as required
    ret
