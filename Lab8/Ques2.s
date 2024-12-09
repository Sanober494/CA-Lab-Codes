# Implement recursive binary search
#Recursive binary search
#int bin_search(int A[], int data, int lo, int hi)
#{
#  int mid;
#  if (lo > hi) return -1
#  mid = (lo + high)/2;
#  if ( data == A[mid]) return mid
#  if ( data < A[mid]) return bin_search(A, data, lo, mid-1)
#  return bin_search(A, data, mid, high+1)
#}



.data
array: .word 28, 35, 59, 60, 61, 79, 82, 86, 87, 97  # Sorted array to search in
length: .word 10                                     # Length of the array (10 elements)
element: .word 0                                     # Variable to store the user input for the element to search
msg0: .asciiz "Enter element to search for - "       # Prompt message to enter the search element
msg1: .asciiz "Element found at index "              # Message to display when the element is found
msg2: .asciiz "Element not found"                    # Message to display when the element is not found

.text
main:
    # Display the prompt to enter the search element
    
    li $v0, 4                                          # System call for printing a string
    la $a0, msg0                                           # Load address of msg0 into $a0
    syscall                                               # Make the system call to print the message

    # Get user input for the element to search for
    
    li $v0, 5                                                 # System call for reading an integer
    syscall                                                   # Make the system call to read the integer
    sw $v0, element                                           # Store the input value in 'element'

    # Set up for the binary search (passing arguments to the search function)

    la $a0, array                                        # Load base address of the array into $a0
    lw $a1, element                                          # Load the target element into $a1
    li $a2, 0                                       # Initialize 'lo' (lower bound) to 0
    lw $a3, length                                   # Load the length of the array into $a3
    addi $a3, $a3, -1                               # Set 'hi' (upper bound) to length - 1

    jal search  # Jump and link to the 'search' function

    # After the search call, result is returned in $v0
    
    move $t0, $v0  # Store the search result in $t0

    # Check if the element was found (if result is -1)
    
    li $t1, -1                                                   # Load -1 into $t1
    beq $t0, $t1, not_found                                    # If result is -1, jump to 'not_found' label

    # Element found, display the success message and index
    
    li $v0, 4                                                   # System call for printing a string
    la $a0, msg1                                                 # Load address of 'msg1' (element found message) into $a0
    syscall                                                       # Make the system call to print the message

    li $v0, 1                                                   # System call for printing an integer
    move $a0, $t0 
    syscall 

    j exit  # Jump to the exit label to terminate the program

not_found:
    # Element not found, display the not found message
    
    li $v0, 4 
    la $a0, msg2 
    syscall  
    
exit:
   
    li $v0, 10  
    syscall  
    
# Recursive binary search function
search:
    # Save the return address on the stack to preserve it during recursion
    
    addi $sp, $sp, -4                             # Adjust the stack pointer to allocate space
    sw $ra, 0($sp)                                  # Save the return address at the top of the stack

    # Check if the search bounds are valid (if lo > hi, return -1)
    ble $a2, $a3, L1                                     # If lo <= hi, jump to L1 (else return -1)
    li $v0, -1                                        # If lo > hi, set return value to -1 (not found)
    addi $sp, $sp, 4                                      # Restore the stack pointer
    jr $ra                                              # Return to the caller

L1:
    # Calculate mid = (lo + hi) / 2 using div instruction
    add $t0, $a2, $a3      # t0 = lo + hi
    div $t0, $t0, 2         # Divide t0 (lo + hi) by 2, quotient in $lo
    mflo $t0                # Move the quotient (mid) from $lo to $t0

    # Load A[mid] into $t2
    mul $t1, $t0, 4         # t1 = mid * 4 (since each word in the array is 4 bytes)
    lw $t2, array($t1)      # Load A[mid] into $t2

    # Compare element with A[mid]
    beq $a1, $t2, equal     # If element == A[mid], jump to 'equal' label
    blt $a1, $t2, lower     # If element < A[mid], search the lower half (left)

    # If element > A[mid], search the upper half (right)
    addi $a2, $t0, 1        # Set lo = mid + 1
    jal search              # Recursive call to search the right half
    lw $ra, 0($sp)          # Restore the return address from the stack
    addi $sp, $sp, 4        # Restore the stack pointer
    jr $ra                  # Return to the caller

equal:
    # Element found at mid, return the index (mid)
    move $v0, $t0           # Store the mid index in $v0
    addi $sp, $sp, 4        # Restore the stack pointer
    jr $ra                  # Return to the caller

lower:
    # If element < A[mid], search the lower half (left)
    addi $a3, $t0, -1       # Set hi = mid - 1
    jal search              # Recursive call to search the left half
    lw $ra, 0($sp)          # Restore the return address from the stack
    addi $sp, $sp, 4        # Restore the stack pointer
    jr $ra                  # Return to the caller
