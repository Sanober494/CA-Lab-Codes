#Find the factorial of a number 

       .data
prompt:     .asciiz "Enter a number: "
result_msg: .asciiz "Factorial is: "

        .text
       

main:
        # Prompt the user to input a number
        li      $v0, 4               
        la      $a0, prompt          
        syscall                       

        # Read the input number
        li      $v0, 5               
        syscall
        move    $t0, $v0            

        li      $t1, 1               # $t1 = result = 1
        li      $t2, 1               # $t2 = counter = 1

factorial_loop:
        # Check if the counter exceeds N
        bgt     $t2, $t0, end_factorial # If counter > N, end the loop

        # Multiply result by counter (result = result * counter)
        mul     $t1, $t1, $t2         # $t1 = result * counter

        # Increment the counter by 1 (counter = counter + 1)
        addi    $t2, $t2, 1           # $t2 = counter + 1
        j       factorial_loop

end_factorial:
        # Print the result message
        li      $v0, 4                
        la      $a0, result_msg       
        syscall

        # Print the factorial result
        li      $v0, 1               
        move    $a0, $t1              
        syscall
        
        li      $v0, 10           
        syscall
