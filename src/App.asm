.data
str1: .asciiz "Enter total number of entries: "
str2: .asciiz "Enter an integer: "
str3: .asciiz "Total positive "
str4: .asciiz "Total negative "
nl: .asciiz "\n"

count: .word 0
i: .word 0
positive: .word 0
negative: .word 0
x: .word 0

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
	sw	$zero, positive
	sw	$zero, negative
	sw	$zero, x
	
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
	sw	$v0, x
	
	lw	$t0, x
	bgtz	$t0, if_positive
	bltz	$t0, if_negative
	j	end_if
if_positive:
	lw	$t0, positive
	add	$t0, $t0, 1
	sw	$t0, positive
	j	end_if
if_negative:
	lw	$t0, negative
	add	$t0, $t0, 1
	sw	$t0, negative
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
	lw	$a0, positive
	syscall
	
	li	$v0, 4
	la	$a0, nl
	syscall
	
	li	$v0, 4
	la	$a0, str4
	syscall
	
	li	$v0, 1
	lw	$a0, negative
	syscall
	
	li	$v0, 10
	syscall