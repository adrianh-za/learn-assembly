.section .data 
msg: .asciz "Result: %d\n"

.extern printf

.section .text
.globl main
main:
    movq %rsp, %rbp #for correct debugging
    # Align stack properly for calling convention
    movq %rsp,  %rbp                # for correct debugging
    subq $32,   %rsp                # Reserve 32 bytes by substract from 
    andq $-16,  %rsp                # Align to 16-byte boundry
    
    # Perform various artithmetic operations
    movq $3,    %rdi                # rdi = 3
    movq $2,    %rax                # rax = 2
    addq %rdi,  %rax                # rax = rax + rdi = 3 + 2 = 5
    mulq %rdi                       # rax = rax * rdi = 3 * 5 = 15

    # printf the value (Linux calling convention)
    #movq %rax, %rsi
    #movq $msg, %rdi
    #call printf
    
    # printf the value (Windows calling convention)
    movq %rax, %rdx
    movq $msg, %rcx
    call printf
    
    # Restore stack and exit
    movq %rbp, %rsp
    movq $0, %rax                   # Clear rax as required
    ret
