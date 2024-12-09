#program to print sum of n natural numbers

.data
n: .word 5              # The value of N for sum calculation 
result: .word 0           # To store the result of RSum(n)
sol: .asciiz "The sum of the natural numbers is:"

.text

# Main function
main:
    # Load the value of n
    lw $a0, n             # Load n into $a0 for the RSum function

    # Call the RSum function
    jal RSum

    # Store the result returned in $v0
    sw $v0, result        # Store result in the data section

#print sol
li $v0, 4
la $a0, sol
syscall

    # Print result
    li $v0, 1             # System call for print integer
    lw $a0, result        # Move result to $a0 for printing
    syscall               # Print result

    # Exit program
    li $v0, 10            # Exit syscall
    syscall

# RSum function
# Computes the sum of first n natural numbers recursively: RSum(n) = n + RSum(n - 1)

RSum:

    # Base case: if n == 1, return 1
    li $t0, 1               #Load 1 into $t0
    beq $a0, $t0, base_case  # If n == 1, go to base_case

    # Recursive case: save registers and make the recursive call

    addi $sp, $sp, -8     # Make space on the stack for $a0 and $ra
    sw $a0, 0($sp)        # Save $a0 (n) on the stack
    sw $ra, 4($sp)        # Save $ra on the stack

    addi $a0, $a0, -1     # Decrement n by 1
    jal RSum              # Recursive call to RSum(n - 1)

    # Restore registers after recursive call
    lw $a0, 0($sp)        # Restore $a0 (n) from the stack
    lw $ra, 4($sp)        # Restore $ra from the stack
    addi $sp, $sp, 8      # Restore stack pointer

    # Add n + result from recursive call
    add $v0, $a0, $v0     # $v0 = n + RSum(n - 1)
    jr $ra                # Return to caller

base_case:
    # If n == 1, return 1 (base case)
    li $v0, 1             # Set $v0 to 1
    jr $ra                # Return to caller
