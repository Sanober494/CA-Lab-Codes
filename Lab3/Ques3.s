
#To find the sum of the digits of a number N. Display the result to the user.
#sum = 0;
#while (N != 0)
#{
#      remainder = N % 10;
#      sum       = sum + remainder;
#      N         = N / 10;
#}

        .data
prompt:     .asciiz "Enter a number: "
sum_msg:    .asciiz "The sum of the digits is: "

        .text
      

main:
        li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0                

        li      $t1, 0

sum_digits:
          # Check if N != 0
        beq     $t0, $zero, display_sum # If N == 0, go to display the sum

        # Find remainder = N % 10
        li      $t2, 10                 # Load 10 into $t2 for modulus
        rem     $t3, $t0, $t2           # $t3 = remainder = N % 10

        # Add remainder to sum
        add     $t1, $t1, $t3           # sum = sum + remainder

        # N = N / 10
        div     $t0, $t0, $t2           # N = N / 10 (integer division)
        j       sum_digits              # Repeat the loop

display_sum:
        li      $v0, 4
        la      $a0, sum_msg
        syscall

        li      $v0, 1
        move    $a0, $t1
        syscall

        li      $v0, 10
        syscall
