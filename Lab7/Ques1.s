#A main procedure calls procedures named sum, difference, product and quotient. 
#All procedures (except main) takes two numbers (x, y) as input arguments and returns the 
#sum (x + y), difference (x-y), product (x*y) and quotient (x/y) values to the main procedure. 
#The result of each operation is displayed to the user.

.data
x:          .word 10           
y:          .word 5            
newLine:    .asciiz "\n"
sum_msg:    .asciiz "Sum: "
diff_msg:   .asciiz "Difference: "
prod_msg:   .asciiz "Product: "
quot_msg:   .asciiz "Quotient: "

.text
main:
    # Load numbers x and y
    lw $s0, x                 # Load x into $a0
    lw $s1, y                 # Load y into $a1

    # Call sum procedure
    jal sum                   # Call sum
    move $t0, $v0             # Store result in $t0
    li $v0, 4                 # Print "Sum: "
    la $a0, sum_msg
    syscall
    li $v0, 1                 # Print sum result
    move $a0, $t0
    syscall
    li $v0, 4                 # Print newline
    la $a0, newLine
    syscall

    # Call difference procedure
    jal difference            # Call difference
    move $t1, $v0             # Store result in $t1
    li $v0, 4                 # Print "Difference: "
    la $a0, diff_msg
    syscall
    li $v0, 1                 # Print difference result
    move $a0, $t1
    syscall
    li $v0, 4                 # Print newline
    la $a0, newLine
    syscall

    # Call product procedure
    jal product               # Call product
    move $t2, $v0             # Store result in $t2
    li $v0, 4                 # Print "Product: "
    la $a0, prod_msg
    syscall
    li $v0, 1                 # Print product result
    move $a0, $t2
    syscall
    li $v0, 4                 # Print newline
    la $a0, newLine
    syscall

    # Call quotient procedure
    jal quotient              # Call quotient
    move $t3, $v0             # Store result in $t3
    li $v0, 4                 # Print "Quotient: "
    la $a0, quot_msg
    syscall
    li $v0, 1                 # Print quotient result
    move $a0, $t3
    syscall
    li $v0, 4                 # Print newline
    la $a0, newLine
    syscall

    # Exit program
    li $v0, 10                # Exit syscall
    syscall

# Sum procedure
sum:
    add $v0, $s0, $s1       # $v0 = x + y
    jr $ra                    # Return to caller

# Difference procedure
difference:
    sub $v0, $s0, $s1         # $v0 = x - y
    jr $ra                   

# Product procedure
product:
    mul $v0, $s0, $s1         # $v0 = x * y
    jr $ra                    

# Quotient procedure
quotient:
    div $s0, $s1              # Perform x / y
    mflo $v0                  # Move quotient to $v0
    jr $ra                    
