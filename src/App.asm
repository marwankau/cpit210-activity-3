.data
count:.word 0
i:.word 0
top_student:.word -1
 score:.word 0 
 str1:.asciiz  "Enter total number of students: "
 str2:.asciiz "Enter student score : "
 str3:.asciiz "Highest score is "
 
 .text
 
 main:
 #printing str1
 li $v0,4
 la $a0,str1
 syscall 
 
 #reading count value(int)
 li $v0,5
 syscall 
 
 #copying the value to count word
 move $t0,$v0
 sw $t0,count 
   

loop_begin:
#loading values for loop condtion
lw $t1,i
lw $t0,count

    blt    $t1, $t0, loop_body1
    j      loop_end

loop_body1:


#printing str2
 li $v0,4
 la $a0,str2
 syscall 
 
 #reading score value(int)
 li $v0,5
 syscall 

#copying the value to score word
 move $t3,$v0
 sw $t3,score 
 
 
 
 #loading values for loop condtion
lw $t3,score
lw $t2,top_student

    bgt    $t3, $t2, loop_body2
   j       else
   
loop_body2:

 lw $t3,score 
 sw $t3, top_student
 
 else: 
 
 #i++
lw $t1, i
 add $t1,$t1, 1
 sw $t1, i
 
  
  j loop_begin
  
  loop_end: 
  
 #printing str3
 li $v0,4
 la $a0,str3
 syscall
 
 #printing top_student
 li $v0,1
 lw $t2, top_student
 la $a0,($t2)
 syscall
 
 #exiting program
 li $v0,10
 syscall
 
