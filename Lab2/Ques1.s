#Write a MIPS program to take two integer values from the user, add these values and print the output

.data
msg1: .asciiz "Enter number 1: "
msg2: .asciiz "Enter number 2: "
msg3: .asciiz "The sum is: "

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

add $t2, $t0, $t1

#reading msg3
li $v0,4
la $a0,msg3
syscall

#print sum
li $v0,1
move $a0, $t2
syscall

#end of program
li $v0,10
syscall
