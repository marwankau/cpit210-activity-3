.data
	str1: .asciiz "Enter total number of students: "
	str2: .asciiz "Enter student score: "
	str3: .asciiz "Highest score is "
	c: .word 0
	num_stu: .word 0
	top_stu: .word 0
	score: .word 0
	
.globl main

.text

main:
	li	$v0, 4
	la 	$a0, str1
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	sw	$t0, num_stu
	
	lw	$t1, c

loop_be:
	blt	$t1, $t0, loop_bo
	j	loop_e
	
	
loop_bo:
	
	lw	$t1, c
	add	$t1, $t1, 1
	sw	$t1, c

	li	$v0, 4
	la	$a0, str2
	syscall
	
	li	$v0, 5
	syscall
	move	$t2, $v0
	sw	$t2, score
	lw	$t3, top_stu
	
	
	bgt	$t2, $t3, if_true
	j	loop_be
if_true:
	lw	$t2, score
	lw	$t3, top_stu
	move	$t3, $t2
	sw	$t3, top_stu
	j	loop_be
loop_e:
	li	$v0, 4
	la	$a0,str3
	syscall
	
	li	$v0, 1
	lw	$t3, top_stu
	move	$a0, $t3
	syscall
	
		
	li	$v0, 10
	syscall
		
