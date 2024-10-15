#Write the MIPS ALP for the high level code. Observe precedence and associativity rules. 
#a  = a * b / c % d + e;

        .data
a:      .word 7
B:      .word 8
c:      .word 2
d:      .word 4
e:      .word 5

        .text
        

main:
        # Load values of a, b, c, d, e from memory into registers
        lw      $t0, a           
        lw      $t1, B           
        lw      $t2, c           
        lw      $t3, d           
        lw      $t4, e           

        # Step 1: a * b
        mul     $t5, $t0, $t1    # $t5 = a * b

        # Step 2: (a * b) / c
        div     $t5, $t2         # $t5 = (a * b) / c

        # Step 3: ((a * b) / c) % d
        rem     $t5, $t5, $t3    # $t5 = ((a * b) / c) % d

        # Step 4: Add e -> ((a * b) / c) % d + e
        add     $t5, $t5, $t4    # $t5 = ((a * b) / c) % d + e

        # Store the result back into a
        addi $t0, $t5, 0

        # Print the solution
        li $v0, 1
        move $a0, $t0
        syscall  

        # End the program
        li      $v0, 10          # System call for exit
        syscall
