#Write a MIPS program to take two integer values from the user, DIVIDE these values and print the output

.data
msg1: .asciiz "Enter the value of a: "
msg2: .asciiz "Enter the value of b: "
msg3: .asciiz "The solution is: "

.text
main:

#reading msg1
li $v0,4
la $a0,msg1
syscall

#taking user int input
li $v0,5
syscall
move $t0,$v0   #storing the result

#reading msg2
li $v0,4
la $a0,msg2
syscall

#taking user int input
li $v0,5
syscall
move $t1,$v0   #storing the result

#reading msg3
li $v0,4
la $a0,msg3
syscall

#performing the operartions
div $t3, $t0, $t1

#print solution
li $v0,1
move $a0, $t3
syscall

#end of program
li $v0,10
syscall
