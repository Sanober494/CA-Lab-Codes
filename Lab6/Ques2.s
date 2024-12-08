#Store the reversed string in memory. Also display the reversed string to the user.

.data
msg1: .asciiz "I love chocolates and plushies"  
msg2: .asciiz "The reversed string is: "       
rev: .space 50      
                          #
.text
main:
    # Load the original string address and initialize length counter
    la $t1, msg1
    li $t0, 0


findLength:
    lb $t2, 0($t1)        # Load byte from the original string
    beq $t2, $zero, reverse  # If null terminator found, go to reverse
    addi $t0, $t0, 1       # Increment length counter
    addi $t1, $t1, 1       # Move to the next character
    j findLength


reverse:
    la $t1, msg1           # Reload original string address
    add $t3, $t0, -1       # Set $t3 to the last index (length - 1)
    la $t9, rev            # Load address of reversed string buffer

revLoop:
    blt $t3, $zero, ep     # Exit loop if index < 0
    add $t4, $t1, $t3      # Calculate address of the character at index $t3
    lb $t5, 0($t4)         # Load character from calculated address
    sb $t5, 0($t9)         # Store it in the reversed string
    addi $t3, $t3, -1      # Decrement index
    addi $t9, $t9, 1       # Move to the next position in reversed string
    j revLoop

ep:
    # Print message
    li $v0, 4
    la $a0, msg2
    syscall

    # Print reversed string
    li $v0, 4
    la $a0, rev
    syscall

    # Exit program
    li $v0, 10
    syscall
