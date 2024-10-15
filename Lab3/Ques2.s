#To read a number N from input and find if the number is odd or even. Display the result to the user.


.data
prompt:     .asciiz "Enter a number: "
even_msg:   .asciiz " is an even number"
odd_msg:    .asciiz " is an odd number"

.text

main:
        # Prompt the user for input
        li      $v0, 4                  
        la      $a0, prompt              
        syscall                          

        # Read the integer input from the user
        li      $v0, 5                  
        syscall                         
        move    $t0, $v0                

        # Check if the number is even or odd
        andi    $t1, $t0, 1             # Perform bitwise AND with 1 (check least significant bit)
        beq     $t1, $zero, even        # If result is 0, it's even; branch to even label


odd:
        li      $v0, 1                  
        move    $a0, $t0                
        syscall

        li      $v0, 4                  
        la      $a0, odd_msg            
        syscall
        j       end_program             


even:
        li      $v0, 1                  
        move    $a0, $t0                
        syscall

        li      $v0, 4                  
        la      $a0, even_msg           
        syscall

end_program:
        li      $v0, 10                
        syscall
