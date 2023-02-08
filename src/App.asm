.data

	      str1: .asciiz "Enter total number of students: "
        str2: .asciiz "Enter student score: "
        str3: .asciiz "Highest score is: "
        

.globl main
.text        

main:
	
	li $v0, 4
	la $a0, str1	
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0                   #t0 is  count
	
	li $t1, 0 			                #t1 is  i
	li $t2, -1                      #t2 is  top_student  

	
loop_begin:
	blt $t1, $t0,loop_body 
	j loop_end
	
loop_body:
	li $v0,4
	la $a0,str2
	syscall
	
	li $v0,5
	syscall
	move $t3,$v0                  #t3 is score
	
	
		
	addiu $t1,$t1,1              #loop counter
	bgt $t3,$t2,loop_body2
                j loop_begin
                
loop_body2:
	 move  $t2, $t3

               j loop_begin

loop_end:
	li $v0,4
	la $a0,str3
	syscall
	li $v0,1
	move $a0,$t2
	syscall
	li $v0,10
	syscall
		
