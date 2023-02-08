.data
	
	str1:  .asciiz "Enter total number of students:  "
	str2: .asciiz "Enter student score: "
	str3: .asciiz "Highest score is "
	count: 		.word 	0 # t0
	i: 		.word	0 # t1
	top_student: 	.word 	-1 # t4
	score: 		.word 	0  # t





.globl main
.text
main:
	li	$v0, 4
	la	$a0, str1
	syscall # print the string
	
	li  	$v0, 5
    	syscall # read count
    	
    	move 	$t0, $v0
    	sw	$t0, count
    	
	lw $t1,i
	lw $t4, top_student
	lw $t3,score
	
loop_begin:
	blt $t1,$t0, loop_body
	j loop_end
 
loop_body:
	
	li	$v0, 4
	la	$a0, str2
	syscall
	
	li  	$v0, 5
    	syscall # read score 
    
    	move 	$t3, $v0
    	sw	$t3, score
    	add $t1,$t1,1
    	bgt $t3,$t4,L1
  
    	j loop_begin
    
L1:
	move $t4,$t3
	sw $t4, top_student
	j loop_begin
	

loop_end: 
	li	$v0, 4
	la	$a0, str3
	syscall
	
	li  $v0, 1
    	move $a0, $t4
    	syscall
    	
    	
	
