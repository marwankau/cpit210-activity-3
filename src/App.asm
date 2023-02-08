.data
i : .word 0
top_student : .word -1
score: .word 0
count :.word 0
str1 : .asciiz "Enter total number of students: "
str2: .asciiz "Enter student score: "
str3: .asciiz "Highest score is "
.globl main

.text

main :
	li $t7,1
	li $v0,4
	la     $a0, str1
	syscall
	li $v0,5 
	syscall
	move $t0,$v0 # count
	sw $t0,count
	
	lw $t1,i
loop_start:
 blt $t1,$t0, loopBody
 
 j endLoop
 
 loopBody:
 	li $v0,4
 	la $a0,str2
 	syscall
 
 	li $v0,5
	 syscall
 	move   $t2, $v0
	sw     $t2, score # score rigester
	add $t1, $t1,$t7
	lw $t3, top_student
	bgt $t2,$3,if_body
	j	loop_start
	
	
if_body:
move $t3,$t2
sw $t3,top_student
j	loop_start

endLoop:
li $v0,4
la $a0,str3
syscall 
li $v0,1
move $a0,$t3
syscall 
