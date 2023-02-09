.data

prompt1: .asciiz " Enter total number of entries: "

prompt2: .asciiz " Enter an integer: "

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


	 li $t2, 0 

	 li $t3, 0 

 	li $t4, 0 

 	li $t5, 0 

    loop: 
    
     bge $t2,$t0,endLoop # if i >= count then go to endLoop


     li $v0, 4 
     la $a0, prompt2 
     syscall 

     li $v0, 5 
     syscall 

     move $t5,$v0   

     bgtz $t5 ,positiveCount  

        addi $t4 ,$t4 ,1

        j endIf  

    positiveCount : addi $t3 ,$t3 ,1 

    endIf : addi $t2 ,$t2 ,1

    j loop

    endLoop : li $v0 ,4
    la $a0 ,positiveMsg
    syscall 

    li $v0 ,1
    move $a0 ,$t3 
    syscall 

    li $v0 ,4
    la $a0 ,negativeMsg
    syscall

    li $v0 ,1
    move $a0 ,$t4
    syscall
