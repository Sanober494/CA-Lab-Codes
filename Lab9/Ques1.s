# Calculate the area of a circle

.data
radius: .float 5.5              # Radius of the circle (example: 5.5)
pi: .float 3.1415926535897924   # Value of Pi
area: .float 0.0                # To store the calculated area
msg1: .asciiz "The area of the circle is: "

.text

main:
    # Load the radius
    l.s $f0, radius             # Load radius into $f0 (floating-point register)

    # Calculate radius^2
    mul.s $f2, $f0, $f0         # $f2 = radius * radius

    # Multiply by Pi
    l.s $f3, pi                 # Load Pi into $f3
    mul.s $f4, $f2, $f3         # $f4 = radius^2 * Pi

    # Store the result in area
    s.s $f4, area               # Store the calculated area in memory

    # Print the message
    li $v0, 4                   # Syscall to print a string
    la $a0, msg1                # Load the message address into $a0
    syscall

    # Print the area
    li $v0, 2                   # Syscall to print a float
    l.s $f12, area              # Load the calculated area into $f12 for printing
    syscall

    # Exit the program
    li $v0, 10                  # Syscall to exit
    syscall
