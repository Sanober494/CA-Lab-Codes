#Write a MIPS program to find the solution to this equation:  (a-b) + (c-5)

.data
msg1: .asciiz "Enter the value of a: "
msg2: .asciiz "Enter the value of b: "
msg3: .asciiz "Enter the value of c: "
msg4: .asciiz "The solution is: "

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

#taking user int input
li $v0,5
syscall
move $t2,$v0   #storing the result

#performing the operations
sub $t3, $t0, $t1
addi $t4, $t2, -5
add $t5, $t3, $t4

#reading msg4
li $v0,4
la $a0,msg4
syscall

#print solution
li $v0,1
move $a0, $t5
syscall

#end of program
li $v0,10
syscall
