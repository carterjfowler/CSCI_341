.data
    prompt: .asciiz "Enter a number: "
    output: .asciiz " factorial is "
.text
.globl main
main:
	
	# Your code here
    #get user input
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    add $a0, $v0, $0     #counter
    add $a1, $0, $v0     #total so far
    addi $sp, $sp, -12
    sw $v0, 0($sp)
    jal Fac

    Exit:
        lw $a0, 0($sp)
        li $v0, 1
        syscall
        la $a0, output
        li $v0, 4
        syscall
        lw $a0, 4($sp)
        addi $sp, $sp, 12
        li $v0, 1
        syscall
        li $v0, 10
        syscall

Fac:
    beq $a0, $0, Exit
    addi $t3, $0, 1
    beq $a0, $t3, Exit
    addi $t0, $a0, -1
    add $t1, $0, $0
    Loop:
        add $t1, $t1, $a1
        addi $t0, $t0, -1
        bne $t0, $0, Loop
    add $a1, $t1, $0
    add $a0, $a0, -1
    sw $a1, 4($sp)
    j Fac
