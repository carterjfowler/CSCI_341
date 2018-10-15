.data
    opening: .asciiz "Summation Calculator (enter 0 to end)\n"
    prompt1: .asciiz "Enter number "
    prompt2: .asciiz ": "
    output: .asciiz "The sum of the inputs is "
.text
.globl main
main:
	
	# Your code here
    #get user input
    la $a0, opening
    li $v0, 4
    syscall
    addi $t0, $0, 1
    add $t1, $0, $0
    Loop:
         la $a0, prompt1
         li $v0, 4
         syscall
         add $a0, $t0, $0
         li $v0, 1
         syscall
         la $a0, prompt2
         li $v0, 4
         syscall
         li $v0, 5
         syscall
         addi $sp, $sp, -4
         sw $v0, 0($sp)
         beq $v0, $0, Exit      #if user enters 0 exit loop
         jal Sum
         add $t1, $t1, $v0
         addi $sp, $sp, 4       #pop stack
         addi $t0, $t0, 1
         j Loop
    Exit:
        la $a0, output
        li $v0, 4
        syscall
        add $a0, $t1, $0
        li $v0, 1
        syscall
        li $v0, 10
        syscall

Sum:
    lw $s0, 0($sp)
    add $v0, $s0, $0
    jr $ra
