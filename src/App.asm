.data
entries: .asciiz "Enter total number of entries: "
Integer: .asciiz "Enter an enteger: "
positiveMassage: .asciiz "Total Positive: "
NegativeMassage: .asciiz "Total Negative: "
new_line: .asciiz "\n"

count: .word 0 
i: .word 0
positive: .word 0
negative: .word 0
x: .word 0


.globl main

.text

main:
# print entries
li	$v0, 4
la	$a0, entries
syscall

# read count
li	$v0, 5
syscall
move  $t0, $v0
sw $t0, count

lw $t1, i
lw $t0, count
lw $t4, negative


 loop_starts:
 blt	$t1, $t0, loop_body
 j	end_loop
 
 
 loop_body:
 # increment 
 lw	$t1, i
add 	$t1, $t1, 1
sw	$t1, i


 lw $t2, x
 
 # print enter Integers
 li	$v0, 4
la	$a0, Integer
syscall
# read x
li     $v0, 5
syscall
move	$t2, $v0
sw		$t2, x

# if else
beqz $t2, zero

bgtz 		$t2, pos
j		negativ

pos: 
lw	$3, positive
add 	$t3, $t3, 1
sw	$t3, positive
j	loop_starts
negativ:
lw	$t4, negative
add 	$t4, $t4, 1
sw	$t4, negative

j	loop_starts
zero:


j	loop_starts
end_loop:
lw	$t4, negative
lw	$t3, positive

li 	$v0, 4
la 	$a0, positiveMassage
syscall


li    $v0, 1
lw    $t3, positive
move   $a0, $t3
syscall

li	$v0, 4
la	$a0, new_line
syscall


li 	$v0, 4
la 	$a0, NegativeMassage
syscall
    
    
li    $v0, 1
lw    $t4, negative
move   $a0, $t4
syscall


li  $v0, 10
    syscall
