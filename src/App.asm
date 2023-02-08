.data	
str1: .ascii "Enter total number of students: \0"
str2: .ascii "Enter student score: \0"
str3: .ascii "Highest score is \0"
count: .word 0
i: .word 0
top_student: .word-1
score: .word 0

.globl main


.text


main:
li $t6,1
lw $t4,top_student

li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0
sw $t0, count

lw $t1,i

loop_begin:
blt $t1,$t0,loop_body
j	loop_end

loop_body:
li $v0,4
la $a0,str2
syscall

li $v0,5
syscall
move $t3,$v0
sw $t3,score

add $t1,$t1,$t6
sw $t1,i
bgt $t3,$t4,loop_body2
j	loop_begin
loop_body2:
sw $t3,top_student
lw $t4,top_student
j	loop_begin
loop_end:
li $v0,4
la $a0, str3
syscall
li $v0,1
move $a0,$t4
syscall
li $v0,10
syscall
