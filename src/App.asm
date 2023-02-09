.data

str1: .asciiz "Enter total number of entries: "
str2: .asciiz "Enter an integer: "
str3: .asciiz "Total positive "
str4: .asciiz "\nTotal negative "

largest: .word -1
count: .word 0
x: .word 0
y: .word 0
pos: .word 0
neg: .word 0

.text

la $a0, str1
li $v0, 4
syscall

li $v0,5
syscall
move $t0, $v0
sw $t0,count

li $t6,1
lw $t1, x
lw $t2, largest
lw $t3, y

loop_start:
blt $t1,$t0, loop_body
j end

if:
move $t2,$t3
sw $t2, largest
j  loop_start
 
loop_body:
li $v0, 4
la $a0,str2
syscall
 
li $v0,5
syscall 
move $t3,$v0
add $t1,$t1,$t6
sw $t1,x
bgt $t3,$t2,if
j loop_start

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
