# Linear search using procedure Input arguments to the procedure: Address of the array, total number of elements and search element Return value(s): 0 (element not found), 1 (element found), index

.data
array:      .word 5, 10, 15, 20, 25  # Example array
n:          .word 5                  # Number of elements
search:     .word 15                 # Element to search
found_msg:  .asciiz "Element found at index: "
not_found_msg: .asciiz "Element not found.\n"

.text

# Main procedure
main:
    # Load input arguments
    la $a0, array         # Load address of the array into $a0
    lw $a1, n             # Load number of elements into $a1
    lw $a2, search        # Load search element into $a2

    # Call the search procedure
    jal search_element

    # Check the return value
    beq $v0, 0, not_found    # If $v0 == 0, element not found
    li $v0, 4                # Print "Element found at index: "
    la $a0, found_msg
    syscall
    li $v0, 1                # Print the index
    move $a0, $v1
    syscall
    j exit                   # Exit program

not_found:
    li $v0, 4                # Print "Element not found"
    la $a0, not_found_msg
    syscall

exit:
    li $v0, 10               # Exit syscall
    syscall

# Input: $a0 = address of array, $a1 = number of elements, $a2 = search element
# Output: $v0 = 1 (found) or 0 (not found), $v1 = index (if found)

search_element:
    li $t0, 0               # Index counter ($t0 = 0)

loop:
    beq $t0, $a1, not_found_proc  # If index == number of elements, exit (not found)
    lw $t1, 0($a0)          # Load the current element from the array
    beq $t1, $a2, found_proc # If element == search element, found
    addi $t0, $t0, 1        # Increment index
    addi $a0, $a0, 4        # Move to the next element in the array
    j loop                  # Repeat loop

not_found_proc:
    li $v0, 0               # Set return value to 0 (not found)
    jr $ra                  # Return to caller

found_proc:
    li $v0, 1               # Set return value to 1 (found)
    move $v1, $t0           # Set index of the found element in $v1
    jr $ra                  # Return to caller
