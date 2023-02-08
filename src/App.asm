.data
  str1: .asciiz "Enter total number of students: "
	str2: .asciiz "Enter student score: "
	str3: .asciiz "Highest score is: "
	
	count: .word 0
	i: .word 0
	top_student: .word -1
	score: .word 0

.globl main

.text

main:    
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	sw $t0, count
	
	lw $t1, i
	lw $t0, count
	

loop:
	
	blt $t1, $t0, enter_loop
	j	end
	
enter_loop:
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	sw $t2, score
	
	lw $t3, top_student
	lw $t2, score
	
	bgt $t2, $t3, if
	add $t1, $t1, 1
	sw $t1, i
	j loop

if:
	move $t3, $t2
	sw $t3, top_student
	add $t1, $t1, 1
	sw $t1, i
	j loop
	
end:
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 1
	lw $t3, top_student
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall
	
	
	
