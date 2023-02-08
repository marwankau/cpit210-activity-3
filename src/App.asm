.data
      
       txt1: .asciiz " Enter total number of students: " 
       txt2: .asciiz "Enter student score: "
       txt3: .asciiz "Highest score is " 
       x: .word 0
       top: .word 0
       sco: .word 0
       stuN: .word 0
       
.globl main

.text 

    main: 
               li $v0,4
               la $a0,txt1
               syscall 
               
               li $v0,5
               syscall 
               
               move $t0,$v0
               sw $t0,stuN
               lw $t1,x
               
loop1:
               blt $t1,$t0,loop2
               j loop3
               
loop2:

               lw $t1,x
               add $t1,$t1,1
               sw $t1,x
               li $v0,4
               la $a0,txt2
               syscall 
               
               li $v0,5
               syscall 
               
               move $t2,$v0
               sw $t2,sco
               lw $t3,top
               bgt $t2,$t3,if_T
               j loop1
               
if_T:

               lw $t2,sco
               lw $t3,top
               move $t3,$t2
               sw $t3,top    
               j loop1      
               
loop3:

               li $v0,4
               la $a0,txt3
               syscall 
               
               li $v0,1
               lw $t3,top
               move $a0,$t3
               syscall 
               
               li $v0,10
               syscall 
