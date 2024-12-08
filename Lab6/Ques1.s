#Find the length of a string stored in memory.

.data
msg1: .asciiz "I love chocolates and plushies"
msg2: .asciiz "The length of the string is: "

.text
main:

la $t1, msg1        # load address of the string
li $t0, 0          #counter

loop:
lb $t2, 0($t1)        #load the byte of the current address 
beq $t2 $zero, ep     #exit loop if null found and end program
addi $t0, $t0, 1       #increment counter
addi $t1, $t1, 1        #move to the next character
j loop

ep:
li $v0, 4
la $a0, msg2
syscall 

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall
