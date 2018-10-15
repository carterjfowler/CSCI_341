.data
	prompt: .asciiz "Number of squares to sum: "
    output: .asciiz "Sum of the first n squares: "
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
    add $a0, $v0, $0
    jal Sum
    add $t0, $v0, $0
    la $a0, output
    li $v0, 4
    syscall
    add $a0, $t0, $0
    li $v0, 1
    syscall

    # Exit
    Exit:
    li $v0, 10
    syscall

Sum:
    add $v0, $0, $0
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    While:
        beq $a0, $0, Final
        sw $v0, 4($sp)
        jal Square
        add $v1, $v0, $0
        lw $v0, 4($sp)
        add $v0, $v0, $v1
        addi $a0, $a0, -1
        lw $ra, 0($sp)
        j While
    Final:
        jr $ra

Square:
    add $v0, $0, $0             #$v0 = 0
    add $t2, $a0, $0
    Loop:
        beq $t2, $0, End
        add $v0, $v0, $a0
        addi $t2, $t2, -1
        j Loop
    End:
        jr $ra
