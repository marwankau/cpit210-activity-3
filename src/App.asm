.data
str1: .asciiz "Enter total number of students: "
str2: .asciiz "Enter student score: "
str3: .asciiz "Highest score is "

count: .word 0
i: .word 0
top_student: .word -1
score: .word 0

.globl main

.text

main:
	la	$a0, str1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, count
	sw	$zero, i
	sw	$zero, score
	li	$t0, -1
	sw	$t0, top_student
	
loop_begin:
	lw	$t0, count
	lw	$t1, i
	blt	$t1, $t0, loop_body
	j	loop_end
loop_body:
	la	$a0, str2
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, score
	
	lw	$t0, score
	lw	$t1, top_student
	bgt	$t0, $t1, if_body
	j	end_if
if_body:
	sw	$t0, top_student
end_if:
	lw	$t0, i
	add	$t0, $t0, 1
	sw	$t0, i
	j	loop_begin
loop_end:
	
	li	$v0, 4
	la	$a0, str3
	syscall
	
	li	$v0, 1
	lw	$a0, top_student
	syscall
	
	li	$v0, 10
	syscall