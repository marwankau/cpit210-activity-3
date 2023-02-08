.data

str1: .asciiz "Enter total number of students:"
str2: .asciiz "Enter student score:"
str3: .asciiz "Highest score is "
count: .word 0
i: .word 0
top_student: .word -1
score: .word 0

.globl main

.text

main:

la $a0, str1
li $v0, 4
syscall

li $v0,5
syscall
move $t0, $v0
sw $t0,count

li $t6,1
lw $t1, i
lw $t2, top_student
lw $t3, score


begine_loop:
 blt $t1,$t0, body_loop
j end
 


body_2:
move $t2,$t3
sw $t2, top_student
j	begine_loop
 
 
 
 
 
 body_loop:
  li $v0, 4
 la $a0,str2
 syscall
 
 li $v0,5
 syscall 
move $t3,$v0
add $t1,$t1,$t6
sw $t1,i
bgt $t3,$t2,body_2
j begine_loop

end:
li $v0,4
la $a0,str3
syscall
move $a0,$t2
li $v0,1
syscall

li $v0,10
syscall
