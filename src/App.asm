.data
	str1: .asciiz "Enter total number of entries: "
	str2: .asciiz "Enter an integer: "
	totalPositive: .asciiz "Total positive "
	totalNegative: .asciiz "Total negative "
	

.globl main

.text

main:

    #print 
    la $a0, str1
    li $v0, 4
    syscall

    #scan the counter
    li $v0, 5
    syscall
    move $t0, $v0 

    # Initialize variables instead of using .word
    li $t1, 0 # i = 0
    li $t2, 0 # positive = 0
    li $t3, 0 # negative = 0
    li $t4, 0 # x = 0

    #while loop 
    loop:
        beq $t1, $t0, endLoop 

        # Print str2
        la $a0, str2
        li $v0, 4
        syscall

        # Read integer input
        li $v0, 5
        syscall
        move $t4, $v0 # Store the input in $t4

        # Check if x > 0
        bgtz $t4, positive #branch great than zero is used here
        add $t3, $t3, 1 # negative++
        j continue
        positive:
        add $t2, $t2, 1 # positive++

        continue:
        add $t1, $t1, 1 # i++
        j loop

    endLoop:
        # Print total positive
        la $a0, totalPositive
        li $v0, 4
        syscall
        li $v0, 1
        move $a0, $t2
        syscall

        # Print total negative
        la $a0, totalNegative
        li $v0, 4
        syscall
        
        li $v0, 1
        move $a0, $t3
        syscall

        # Exit the program
        li $v0, 10
        syscall
