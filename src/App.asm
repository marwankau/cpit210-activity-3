.data


str1: .asciiz "Enter how many number: "
    str2: .asciiz "Enter number #"
    str3: .asciiz "Total: "
    str4: .asciiz "Average: "
    new_line: .asciiz "\n"
    
    # the varible i will use it 
    x:    .word 0
    sum:  .word 0
    c:    .word 0
    n:    .word 0
    avg:  .word 0


.globl main  # start of a simblly program

.text

main:
    li     $v0, 4
    la     $a0, str1
    syscall

    li     $v0, 5
    syscall
    move   $t0, $v0
    sw     $t0, n

    lw     $t1, c

loop_begin:    # start of a loop
    blt    $t1, $t0, loop_body
    j      loop_end  # as a break to out of loop 

loop_body:

    lw     $t1, c
    add    $t1, $t1, 1   # add two var 
    sw     $t1, c

    li     $v0, 4
    la     $a0, str2
    syscall

    li     $v0, 1
 lw     $t1, c
    move   $a0, $t1 
    syscall

    li     $v0, 11
    li     $a0, 32   # space char ascii code is 32
    syscall

    li     $v0, 5
    syscall
    move   $t2, $v0
    sw     $t2, x

    lw     $t2, x
    lw     $t3, sum
    add    $t3, $t3, $t2   # add two var 
    sw     $t3, sum

    j      loop_begin
loop_end:   # end of the loop

    li    $v0, 4
    la    $a0, str3
    syscall
