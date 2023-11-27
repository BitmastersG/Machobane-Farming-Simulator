#Author: Bitmasters
#Date: 21 November 2023
#Functional Description:
#Pseudocode Description

.data
	wheat:	.word 76
	peas: .word 40
	potatoes: .word 40
	
	maize: .word 28
	pumpkin: .word 16
	beans: .word 48
	sorghum: .word 28
	groundnuts: .word 48
	
	newline:    .asciiz "\n"
    	space:      .asciiz " "
	
	bean_harvest:       .word 1000   # Assuming initial values for harvest weights
  	maize_harvest:      .word 800
    	pumpkin_harvest:    .word 1200
  	groundnut_harvest:  .word 900
    	watermelon_harvest: .word 1500
    	sorghum_harvest:    .word 1000
    	soil_fertility:     .word 10    # Multiply by 10 to represent 1.0
    	summer_harvest: .asciiz "-----Summer Harvest\n---"
	
	summerLength: .word 8
	summerWidth: .word 20
	
	winter_harvest: .asciiz "Winter Harvest: "
    Peas: .asciiz "Peas: "
    Wheat: .asciiz "Wheat: "
    Potatoes: .asciiz "Potatoes: "
    pea_harvest:       .word 1000   # Assuming initial values for harvest weights
    wheat_harvest:      .word 800
    potato_harvest:    .word 1200
	
	 Beans: .asciiz "Beans: "
    Maize: .asciiz "Maize: "
    Groundnuts: .asciiz "Groundnuts: "
    Sorghum: .asciiz "Sorghum: "
    Watermelon: .asciiz "Watermelon: "
    Pumpkin: .asciiz "Pumpkin: "
	
	soil_ready: .word 1
	
.text
reduce_soil_fertility:
	move $t5,$a0
	lw $s0, soil_fertility
	bge $t5, $s0, Else1
	li $s0, 9
	j End1
	Else1:
	sub $s0,$s0,$t5
	End1:
	jr $ra
soilPreparation:
#	sw $ra,$sp
	li $t0, 70
	bge $s0, $t0, Else
	add $s0,$s0,$t0
	j End
	Else:
	li $s0,100
	End:
	jr $ra
winterHarvest:
    # Function Prologue
    subu $sp, $sp, 12   # Make space on the stack for 3 local variables
    sw $ra, 0($sp)      # Save the return address
    sw $t0, 4($sp)      # Save the value of $t0

    # Reduce soil fertility by 25
    

    # Check if rotation is true
    beq $a0, $zero, else_branch  # if rotation is false, jump to else_branch

    # If rotation is true
    # Increase soil fertility by 10
    lw $t0, soil_fertility
    addi $t0, $t0, 10
    sw $t0, soil_fertility

    # Update pea_harvest *= soil_fertility
    lw $t0, pea_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, pea_harvest

    # Update wheat_harvest *= soil_fertility
    lw $t0, wheat_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, wheat_harvest

    # Print the winter harvest message
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, winter_harvest  # load the address of the message string
    syscall

    # Print pea_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, peas       # load the address of the message string
    syscall
    lw $t0, pea_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    # Print wheat_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, wheat      # load the address of the message string
    syscall
    lw $t0, wheat_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    j end_winter_harvest

else_branch:
    # If rotation is false
    # Update potato_harvest *= soil_fertility
    lw $t0, potato_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, potato_harvest

    # Print the winter harvest message
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, winter_harvest   # load the address of the message string
    syscall

    # Print potato_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, Potatoes    # load the address of the message string
    syscall
    lw $t0, potato_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

end_winter_harvest:
    lw $ra, 0($sp)      # Restore the return address
    lw $t0, 4($sp)      # Restore the value of $t0
    addu $sp, $sp, 12   # Restore the stack pointer

    jr $ra              # Jump back to the return address


summerHarvest:
    subu $sp, $sp, 12   # Make space on the stack for 3 local variables
    sw $ra, 0($sp)      # Save the return address
    sw $t0, 4($sp)      # Save the value of $t0

    # Reduce soil fertility by 0.1
    

    # Check if rotation is true
    beq $a0, $zero, Else_branch  # if rotation is false, jump to else_branch

    # If rotation is true
    # Increase soil fertility by 0.1
    lw $t0, soil_fertility
    addi $t0, $t0, 1
    sw $t0, soil_fertility

    # Update bean_harvest *= soil_fertility
    lw $t0, bean_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, bean_harvest

    # Update maize_harvest *= soil_fertility
    lw $t0, maize_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, maize_harvest

    # Update pumpkin_harvest *= soil_fertility
    lw $t0, pumpkin_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, pumpkin_harvest

    # Print the summer harvest message
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, summer_harvest   # load the address of the message string
    syscall

    # Print bean_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, beans       # load the address of the message string
    syscall
    lw $t0, bean_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    # Print maize_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, maize     # load the address of the message string
    syscall
    lw $t0, maize_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    # Print pumpkin_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, pumpkin    # load the address of the message string
    syscall
    lw $t0, pumpkin_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    j end_summer_harvest

Else_branch:
    # If rotation is false
    # Increase soil fertility by 0.1
    lw $t0, soil_fertility
    addi $t0, $t0, 1
    sw $t0, soil_fertility

    # Update groundnut_harvest *= soil_fertility
    lw $t0, groundnut_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, groundnut_harvest

    # Update watermelon_harvest *= soil_fertility
    lw $t0, watermelon_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, watermelon_harvest

    # Update sorghum_harvest *= soil_fertility
    lw $t0, sorghum_harvest
    lw $t1, soil_fertility
    mul $t0, $t0, $t1
    sw $t0, sorghum_harvest

    # Print the summer harvest message
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, newline         # load the address of the newline string
    syscall
    li $v0, 4               # system call code for printing a string
    la $a0, summer_harvest  # load the address of the message string
    syscall

    # Print groundnut_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, groundnuts  # load the address of the message string
    syscall
    lw $t0, groundnut_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    # Print sorghum_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, sorghum     # load the address of the message string
    syscall
    lw $t0, sorghum_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

    # Print watermelon_harvest
    li $v0, 4               # system call code for printing a string
    la $a0, Watermelon   # load the address of the message string
    syscall
    lw $t0, watermelon_harvest
    li $v0, 1               # system call code for printing an integer
    move $a0, $t0
    syscall

end_summer_harvest:
    # Function Epilogue
    lw $ra, 0($sp)      # Restore the return address
    lw $t0, 4($sp)      # Restore the value of $t0
    addu $sp, $sp, 12   # Restore the stack pointer

    jr $ra              # Jump back to the return address

printWinterPlants:
    # Function Prologue
    subu $sp, $sp, 12  # Make space on the stack for 3 local variables
    sw $ra, 0($sp)     # Save the return address
    sw $s0, 4($sp)     # Save the value of $s0

    # Initialize i loop variable
    li $s0, 0          # i = 0

    # Outer loop (i loop)
    outer_loop:
        bge $s0, 4, end_outer_loop  # if i >= 4, exit the outer loop

        # Initialize j loop variable
        li $s1, 0          # j = 0

        # Inner loop (j loop)
        inner_loop:
            bge $s1, 19, end_inner_loop  # if j >= 19, exit the inner loop

            # Print the first character
            li $v0, 11          # system call code for printing a character
            move $a0, $a0       # load the first character to be printed
            syscall

            # Print a space
            li $v0, 4           # system call code for printing a string
            la $a0, space       # load the address of the space string
            syscall

            # Increment j
            addi $s1, $s1, 1

            j inner_loop  # jump back to the beginning of the inner loop

        end_inner_loop:

        # Print a newline
        li $v0, 4               # system call code for printing a string
        la $a0, newline         # load the address of the newline string
        syscall

        # Initialize k loop variable
        li $s2, 0          # k = 0

        # Innermost loop (k loop)
        innermost_loop:
            bge $s2, 10, end_innermost_loop  # if k >= 10, exit the innermost loop

            # Print the second character
            li $v0, 11          # system call code for printing a character
            move $a0, $a1       # load the second character to be printed
            syscall

            # Print three spaces
            li $v0, 4           # system call code for printing a string
            la $a0, space       # load the address of the space string
            syscall
            la $a0, space       # load the address of the space string
            syscall
            la $a0, space       # load the address of the space string
            syscall

            # Increment k
            addi $s2, $s2, 1

            j innermost_loop  # jump back to the beginning of the innermost loop

        end_innermost_loop:

        # Print a newline
        li $v0, 4               # system call code for printing a string
        la $a0, newline         # load the address of the newline string
        syscall

        # Increment i
        addi $s0, $s0, 1

        j outer_loop  # jump back to the beginning of the outer loop

    end_outer_loop:

    # Function Epilogue
    lw $ra, 0($sp)      # Restore the return address
    lw $s0, 4($sp)      # Restore the value of $s0
    addu $sp, $sp, 12   # Restore the stack pointer

    jr $ra              # Jump back to the return address

printSummerPlants:
    addi $sp, $sp, -16      # allocate space on the stack
    sw $ra, 0($sp)          # save the return address
    sw $s0, 4($sp)          # save the value of $s0
    sw $s1, 8($sp)          # save the value of $s1
    sw $s2, 12($sp)         # save the value of $s2

    li $s0, 0               # initialize i to 0
loop1:
    li $t0, 8
    li $t1, 20
    bge $s0,$t0 , end1   # if i >= summer_length, exit loop1
    li $s1, 0               # initialize j to 0
loop2:
    bge $s1, $t1, end2    # if j >= summer_width, exit loop2
    li $v0, 11              # print character syscall
    move $a0, $a1           # move first argument to $a0
    syscall
    li $v0, 4               # print string syscall
    la $a0, space           # load address of space string
    syscall
    addi $s1, $s1, 5        # increment j by 5
    j loop2                 # jump to beginning of loop2
end2:
    li $v0, 4               # print newline syscall
    la $a0, newline
    syscall
    li $s2, 0               # initialize m to 0
loop3:
    bge $s2,$t1, end3   # if m >= summer_width, exit loop3
    li $v0, 11              # print character syscall
    move $a0, $a2           # move third argument to $a0
    syscall
    li $v0, 4               # print string syscall
    la $a0, space           # load address of space string
    syscall
    addi $s2, $s2, 10       # increment m by 10
    j loop3                 # jump to beginning of loop3
end3:
    li $v0, 4               # print newline syscall
    la $a0, newline
    syscall
    li $s1, 0               # initialize o to 0
loop4:
    bge $s1, $t1, end4   # if o >= summer_width, exit loop4
    li $v0, 11              # print character syscall
    move $a0, $a3           # move fourth argument to $a0
    syscall
    li $v0, 4               # print string syscall
    la $a0, space           # load address of space string
    syscall
    addi $s1, $s1, 5        # increment o by 5
    j loop4                 # jump to beginning of loop4
end4:
    li $v0, 4               # print newline syscall
    la $a0, newline
    syscall
    addi $s0, $s0, 1        # increment i by 1
    j loop1                 # jump to beginning of loop1
end1:
    lw $ra, 0($sp)          # restore the return address
    lw $s0, 4($sp)          # restore the value of $s0
    lw $s1, 8($sp)          # restore the value of $s1
    lw $s2, 12($sp)         # restore the value of $s2
    addi $sp, $sp, 16       # deallocate space on the stack
    jr $ra                  # return to caller
main:
 jal printSummerPlants
 jal printWinterPlants
 jal summerHarvest
 jal winterHarvest
