.data

	prompt1: .asciiz "Enter total number of entries: "
	prompt2: .asciiz "Enter an integer: "
	positiveMsg: .asciiz "\nTotal positive "
	negativeMsg: .asciiz "\nTotal negative "

.globl main

.text

main: 
	li $v0, 4 
 	la $a0, prompt1
 	syscall 

 	li $v0, 5 
 	syscall 

 	move $t0, $v0 

	li $t1, 0 
	li $t2, 0 
	li $t3, 0 
 	li $t4, 0 

    loop: 
     bge $t1, $t0, endLoop # if i >= count then go to endLoop

     li $v0, 4 
     la $a0, prompt2 
     syscall 

     li $v0, 5 
     syscall 

     move $t4, $v0   

     bgtz $t4, positiveCount  

        addi $t3, $t3, 1

        j endIf  

    positiveCount : addi $t2, $t2, 1 

    endIf : addi $t1, $t1, 1

    j loop

    endLoop : li $v0, 4
    la $a0, positiveMsg
    syscall 

    li $v0, 1
    move $a0, $t2 
    syscall 

    li $v0, 4
    la $a0, negativeMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall
