.data
	prompt: .asciiz "Number to square: "
    output: .asciiz "Square: "
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
    jal Square
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

Square:
    add $v0, $0, $0             #$v0 = 0
    add $t0, $a0, $0
    Loop:
        beq $t0, $0, End
        add $v0, $v0, $a0
        addi $t0, $t0, -1
        j Loop
    End:
        jr $ra
