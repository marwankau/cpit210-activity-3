.data
topStudent:.word -1
count:.word 0
i:.word 0
 score:.word 0 
 st1:.asciiz  "Enter number of students"
 st2:.asciiz "Enter student score"
 st3:.asciiz "Highest score :"
 .text
 
 main:
 li $v0,4
 la $a0,st1
 syscall 
 li $v0,5
 syscall 
 move $t1,$v0
 sw $t1,count 
  loopStart:

 lw $t0,i
 lw $t1,count
  blt    $t0, $t1, loop_body
  j      loop_end
 loop_body:

 li $v0,4
 la $a0,st2
 syscall  
 li $v0,5
 syscall 
 move $t2,$v0
 sw $t2,score  
 lw $t2,score
 lw $t3,topStudent

 bgt $t2, $t3, if_condetion
 j       else   
 if_condetion:

 lw $t2,score 
 sw $t2, topStudent
  else:  
 
 lw $t0, i
 add $t0,$t0, 1
 sw $t0, i 
  j loopStart
   loop_end: 
   
 li $v0,4
 la $a0,st3
 syscall 
 li $v0,1
 lw $t3, topStudent
 la $a0,($t3)
 syscall
 li $v0,10
 syscall
 
