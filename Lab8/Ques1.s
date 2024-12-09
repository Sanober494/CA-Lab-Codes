# to find the power of a given number using recursion

.data
x:      .word   2      
pow:    .word   4      

.text

main:
    lw $a1, x           # Load base number into $a1
    lw $a2, pow         # Load exponent into $a2
    jal power           # Call power function
    move $a0, $v0       # Move result to $a0 for printing
    li $v0, 1           # Print integer syscall
    syscall

    li $v0, 10          # Exit syscall
    syscall

# Power function
power:
    # Base case: if $a2 == 0, return 1
    beqz $a2, power_base
    addi $sp, $sp, -4   # Allocate space on the stack
    sw $ra, 0($sp)      # Save return address

    addi $a2, $a2, -1   # Decrement exponent
    jal power           # Recursive call

    lw $ra, 0($sp)      # Restore return address
    addi $sp, $sp, 4    # Deallocate stack space

    mul $v0, $a1, $v0   # Multiply base with result
    jr $ra              # Return to caller

power_base:
    li $v0, 1           # Base case: return 1
    jr $ra              # Return to caller
