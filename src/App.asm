.data
str1: .asciii "Enter total number of integers: "

str2: .asciii "Enter an integer: "

str3: .asciii "Total pos_count: "

str4: .asciii "Total neg_count: "

new_line: .asciii "\n"

value: .word 0
 
i: .word 0 

pos_count: .word 0

neg_count: .word 0

input: .word 0

.globl main

.text

main:
# display str1

li	$v0, 4
la	$a0, str1
syscall

# read value

li	$v0, 5
syscall

move  $t1, $v0
 
sw $t1, value
lw $t2, i
lw $t1, value
lw $t5, neg_count


 Begain_loop:
 blt	$t2, $t1, mid_loop
 j	close_loop
 
 
 mid_loop:
 # increasing i by 1 
lw	$t2, i
add 	$t2, $t2, 1
sw	$t2, i


lw $t3, input
 
 # display str2
li	$v0, 4
la	$a0, str2
syscall

# read input from user

li     $v0, 5
syscall

move	$t3, $v0
sw	$t3, input

# if-else statement

beqz $t3, zero

bgtz 	$t3, pos_function
j	neg_function

# if positive
pos_function: 
lw     $3, pos_count
add    $t4, $t4, 1
sw     $t4, pos_count
j      begain_loop

# if negative
neg_function:
lw	$t5, neg_count
add 	$t5, $t5, 1
sw	$t5, neg_count

j	begain_loop
# if = 0
zero:


j	begain_loop

   close_loop:

# loading variables
lw	$t5, neg_count
lw	$t4, pos_count

# pring str3
li 	$v0, 4
la 	$a0, str3

syscall

# print number of positives
li    $v0, 1
lw    $t4, pos_count

move   $a0, $t4
syscall

# print new line
li	$v0, 4
la	$a0, new_line
syscall

# print str4
li 	$v0, 4
la 	$a0, str4
syscall
    
# print number of negatives    
li    $v0, 1
lw    $t5, neg_count
move   $a0, $t5
syscall

# terminate program
li  $v0, 10
    syscall
