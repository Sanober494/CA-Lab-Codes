#Find the output of polinomial ax^2 + bx + c for user-input x.


.data
a: .float 2.0               # Coefficient for x^2
b1:.float 3.0               # Coefficient for x
c: .float 4.0               # Constant term
x: .float 0.0               # User input value of x
result: .float 0.0          # To store the final result
msg1: .asciiz "Enter the value of x: "
msg2: .asciiz "The result of the polynomial is: "

.text
main:
    # Prompt the user for input
    li $v0, 4                # Syscall to print string
    la $a0, msg1             # Load address of prompt message
    syscall

    # Read user input (float x)
    li $v0, 6                # Syscall to read float
    syscall
    s.s $f0, x               # Store user input in x

    # Load coefficients and x
    l.s $f1, a               # Load a into $f1
    l.s $f2, x               # Load x into $f2

    # Compute ax^2
    mul.s $f3, $f2, $f2      # $f3 = x^2
    mul.s $f4, $f1, $f3      # $f4 = a * x^2

    # Compute bx
    l.s $f5, b1              # Load b1into $f5
    mul.s $f6, $f5, $f2      # $f6 = b * x

    # Add ax^2 + bx
    add.s $f7, $f4, $f6      # $f7 = ax^2 + bx

    # Add constant term c
    l.s $f8, c               # Load c into $f8
    add.s $f9, $f7, $f8      # $f9 = ax^2 + bx + c

    # Store the result
    s.s $f9, result          # Store result in memory

    # Print the result message
    li $v0, 4                # Syscall to print string
    la $a0, msg2             # Load address of result message
    syscall

    # Print the result value
    li $v0, 2                # Syscall to print float
    l.s $f12, result         # Load result into $f12
    syscall

    # Exit the program
    li $v0, 10               # Exit syscall
    syscall
