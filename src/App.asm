# Made With Love <3
.data
	# ------Creating String variables In Memory-----------------
	MainInputMessage: .asciiz "Enter total number of entries: "
	enterNumbers: .asciiz "Enter a Number: "
	totalPositiveMessage: .asciiz "\n\nThe Total of Positives is: "
	totalNegativeMessage: .asciiz "   -||-   The Total of Negatives is: "
	
	# ------Creating Integer Variables in Memory----------------
	max: .word 0
	enteredNumber: .word 0 
	countPositive: .word 0
	countNegative: .word 0
	i: .word 0
	


.globl main



.text

	main:
		# print the MainInputMessage message to user
		li	$v0, 4
		la	$a0, MainInputMessage
		syscall

		# read read what the user inputed
		li $v0, 5
		syscall
		move  $t0, $v0 # Move what was read to another register to use later
		sw $t0, max # Here we used the register to move the value to memory

		lw $t2, i # Loaded the i (which is 0) into register t2
		lw $t0, max # Loaded the max (which is what the user input was) into register t0
		lw $t4, countNegative # Loaded the the variable countNegative (which is 0) to rigster t3


		#  We Sperated the while loop to 3 functions for cleaner code
		
		
 		# ------Start Of While Loop------------------
 		
 		while: #where the loop starts
 		blt	$t2, $t0, while_body # if max > i we'll jump to the body 
 		j	ending # like an else statment, so if max == i we're going to jump to the end_loop
 
 		
 		
		# ------While Loop Body---------------------
 		while_body:
 		
 			# incrementing i (i++)
 			lw	$t2, i # Loading i to from memory 
			add 	$t2, $t2, 1 # Adding 1 to i 
			sw	$t2, i # Storing the result back in memory

 			lw $t1, enteredNumber # Loading the variable (which has a value of 0) to use it
 
 			# Print the message enterNumbers
 			li	$v0, 4 # Printing String 
			la	$a0, enterNumbers # moving the String from memory to register to be printed
			syscall
			
			# Read the Enterd value
			li     $v0, 5 # Read Integer
			syscall
			move	$t1, $v0 # Move the read Integer to register
			sw $t1, enteredNumber # Store the Integer it in memory

			# If / Else statment
			beqz $t1, zero  # If the number stored in register is equal to 0 we're just going to ignore it
			bgtz 		$t1, positive # if the number stored in register is greater than 0 we're going to jump to positive function
			j		negative # if the x<0 is the case is true then we're benching to negative function



			# ------Functions Used-----------------
			
			positive: 
				lw	$6, countPositive # load the value from memory (which is 0 at the start of the program)
				add 	$t6, $t6, 1 # Increament by 1
				sw	$t6, countPositive # Move it to memory
				j	while # Jump back to the start
				
			negative:
				lw	$t4, countNegative # load the value from memory (which is 0 at the start of the program)
				add 	$t4, $t4, 1 # Increament by 1
				sw	$t4, countNegative

				j	while	# Jump back to the start
				
			zero:
				# Ignoring the 0s

				j	while # Jump back to the start
			
			
				
				
			# ------While Loop Ending----------------
			
			ending:
				lw	$t4, countNegative # Loading the value from memory
				lw	$t6, countPositive  # Loading the value from memory

				# -------Printing the final results-------
				
				li 	$v0, 4 # Printing String
				la 	$a0, totalPositiveMessage # Load it to a0 for printing
				syscall


				li    $v0, 1 # Printing Integer
				lw    $t6, countPositive # Loading value from memory
				move   $a0, $t6 # Load it to a0 for printing
				syscall


				li 	$v0, 4 # Printing String
				la 	$a0, totalNegativeMessage # Load it to a0 for printing
				syscall
    
    
				li    $v0, 1 # Printing Integer
				lw    $t4, countNegative # Loading value from memory
				move   $a0, $t4 # Load it to a0 for printing
				syscall

				
			

				# ------End of Program-----------------
				li  $v0, 10 # Terminate Program
  				 syscall
