#to check if the string is palindrome or not

.data
string:      .asciiz "madam"   # Predefined string to check
not_pal:     .asciiz "The string is NOT a palindrome."
is_pal:      .asciiz "The string IS a palindrome."

.text

main:
    # Load the address of the string
    la $a0, string         # $a0 points to the string
    
    # Find the length of the string
    li $t0, 0              # Initialize length counter ($t0 = length)

find_length:
    lb $t1, 0($a0)         # Load byte from string
    beq $t1, 0, check_pal  # End of string, proceed to palindrome check
    addi $t0, $t0, 1       # Increment length
    addi $a0, $a0, 1       # Move to the next character
    j find_length

check_pal:
    # Reset pointers
    la $a0, string         # $a0 points to the start of the string
    sub $t1, $t0, 1        # $t1 = last character index
    move $t2, $zero        # $t2 = start index
    move $t3, $t1          # $t3 = end index

palindrome_check:
    # Compare characters
    lb $t4, string($t2)    # Load char from start index
    lb $t5, string($t3)    # Load char from end index
    bne $t4, $t5, not_palindrome # If chars don't match, not a palindrome

    # Update indices
    addi $t2, $t2, 1       # Increment start index
    addi $t3, $t3, -1      # Decrement end index
    blt $t3, $t2, palindrome # If indices cross, it's a palindrome
    j palindrome_check

not_palindrome:
    li $v0, 4              # Print not_pal message
    la $a0, not_pal
    syscall
    j exit

palindrome:
    li $v0, 4              # Print is_pal message
    la $a0, is_pal
    syscall

exit:
    li $v0, 10             # Exit program
    syscall
