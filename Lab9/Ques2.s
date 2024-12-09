# MIPS code to Covert from°F to °C (°C= ((5.0/9.0)*(fahr - 32.0));

.data
fahr: .float 98.6              # Example Fahrenheit value
celsius: .float 0.0            # To store the calculated Celsius value
five: .float 5.0               # Constant 5.0
nine: .float 9.0               # Constant 9.0
thirty_two: .float 32.0        # Constant 32.0
msg1: .asciiz "The temperature in Celsius is: "

.text

main:
    # Load Fahrenheit value
    l.s $f0, fahr              # Load Fahrenheit into $f0

    # Subtract 32.0
    l.s $f1, thirty_two        # Load 32.0 into $f1
    sub.s $f2, $f0, $f1        # $f2 = fahr - 32.0

    # Compute 5.0 / 9.0
    l.s $f3, five              # Load 5.0 into $f3
    l.s $f4, nine              # Load 9.0 into $f4
    div.s $f5, $f3, $f4        # $f5 = 5.0 / 9.0

    # Multiply (5.0 / 9.0) * (fahr - 32.0)
    mul.s $f6, $f5, $f2        # $f6 = (5.0 / 9.0) * (fahr - 32.0)

    # Store the Celsius result
    s.s $f6, celsius           # Store result in celsius

    # Print the message
    li $v0, 4                  # Syscall to print string
    la $a0, msg1               # Load the address of the message into $a0
    syscall

    # Print the Celsius value
    li $v0, 2                  # Syscall to print float
    l.s $f12, celsius          # Load Celsius value into $f12 for printing
    syscall

    # Exit the program
    li $v0, 10                 # Syscall to exit
    syscall
