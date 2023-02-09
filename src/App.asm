.data
str1: .asciiz "Enter total number of entries: "
str2: .asciiz "Enter an integer: "
str3: .asciiz "Total positive "
str4: .asciiz "\nTotal negative "

i: .word 0
count: .word 0
lagest: .word -1
x: .word 0

.text

la $a0, str1
li $v0, 4
syscall

li $v0,5
syscall
move $t0, $v0
sw $t0,count

li $t6,1
lw $t1, i
lw $t2, lagest
lw $t3, x


begine_loop:
blt $t1,$t0, body_loop
j end


body_2:
move $t2,$t3
sw $t2, lagest
j  begine_loop
 

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

li $v0,4
la $a0,str4
syscall
move $a0,$t2
li $v0,1
syscall


li $v0,10
syscall
