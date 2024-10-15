
.data
msg: .asciiz "Enter a number: "
prime: .asciiz " is prime"
notprime: .asciiz " is not prime"

.text
main:

li $v0, 4
la $a0, msg
syscall

#taking user input
li $v0,5
syscall
move $t0,$v0


li $t1, 1
beq $t0, $t1, Nprime

#performing the function
li $t2, 2
div $t3, $t0, 2

loop:
ble $t3, $t2, Yprime
rem $t4, $t0, $t2   # t4 = n % i
beq $t4, $zero, Nprime   # If n % i == 0, go to Nprime

addi $t2, $t2, 1 
j loop

Yprime:
        li      $v0, 1                  
        move    $a0, $t0  
        syscall                    
        li      $v0, 4                 
        la      $a0, prime  
        syscall
        j       ep    

Nprime:
        li      $v0, 1                  
        move    $a0, $t0
        syscall                      
        li      $v0, 4                 
        la      $a0, notprime  
        syscall

ep:
li $v0, 10
syscall
             
