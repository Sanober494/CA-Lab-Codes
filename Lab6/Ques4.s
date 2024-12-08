#code to concatenate two strings

.data
string1:     .asciiz "Hello, "   # First string
string2:     .asciiz "World!"    # Second string
result:      .space 256          # Space to store the concatenated result

.text


main:
    # Initialize pointers
    la $t0, string1          # $t0 points to the first string
    la $t1, string2          # $t1 points to the second string
    la $t2, result           # $t2 points to the result buffer

    # Copy string1 into result
copy_string1:
    lb $t3, 0($t0)           # Load byte from string1
    beq $t3, 0, copy_string2 # If null terminator, go to string2
    sb $t3, 0($t2)           # Store byte in result
    addi $t0, $t0, 1         # Move to the next byte in string1
    addi $t2, $t2, 1         # Move to the next byte in result
    j copy_string1

    # Copy string2 into result
copy_string2:
    lb $t3, 0($t1)           # Load byte from string2
    beq $t3, 0, done         # If null terminator, finish
    sb $t3, 0($t2)           # Store byte in result
    addi $t1, $t1, 1         # Move to the next byte in string2
    addi $t2, $t2, 1         # Move to the next byte in result
    j copy_string2

done:
    sb $zero, 0($t2)         # Add null terminator to the result

    # Print the result
    li $v0, 4                # syscall to print string
    la $a0, result           # Load the address of the result
    syscall

    # Exit
    li $v0, 10               # syscall to exit
    syscall
