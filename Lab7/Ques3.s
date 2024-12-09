# MIPS code to print Fibonacci series

.data
n:          .word 10              # Number of Fibonacci terms to generate
newLine:    .asciiz "\n"          # Newline character
fib_msg:    .asciiz "Fibonacci number: "

.text

main:
    lw $s0,n                     # Load value of n into $a0
    jal fibo                      # Call Fibonacci procedure

    li $v0, 10                    # Exit the program
    syscall


# Input: $a0 = n (number of Fibonacci terms)
# Output: Prints the Fibonacci series up to n terms
fibo:
    li $t0, 0                     # Initialize a = 0
    li $t1, 1                     # Initialize b = 1
    li $t2, 0                     # Initialize c = 0
    li $t3, 1                     # Initialize i = 1

li $v0, 4                     # Print message
    la $a0, fib_msg
    syscall
    li $v0, 1                     # Print first Fibonacci number (0)
    move $a0, $t0
    syscall
    li $v0, 4                     # Print newline
    la $a0, newLine
    syscall

li $v0, 4                     # Print message
    la $a0, fib_msg
    syscall
    li $v0, 1                     # Print second Fibonacci number (1)
    move $a0, $t1
    syscall
    li $v0, 4                     # Print newline
    la $a0, newLine
    syscall

fib_loop:
    bge $t3, $s0, fib_done        # Exit loop if i >= n

    add $t2, $t0, $t1             # c = a + b

    # Print current Fibonacci number
    li $v0, 4                     # Print message
    la $a0, fib_msg
    syscall
    li $v0, 1                     # Print Fibonacci number (c)
    move $a0, $t2
    syscall
    li $v0, 4                     # Print newline
    la $a0, newLine
    syscall

    move $t0, $t1                 # a = b
    move $t1, $t2                 # b = c
    addi $t3, $t3, 1              # i++

    j fib_loop                    # Repeat loop

fib_done:
    jr $ra                        # Return to caller
