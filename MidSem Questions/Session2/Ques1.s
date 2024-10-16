#MIPS program to create a counter, with start, stop and step given by the users [increment the values]

.data
start: .asciiz "Enter start value:"
stop: .asciiz "Enter stop value: "
step: .asciiz "Enter step value: "
sp: .asciiz " "

.text
main:

#start value
li $v0,4
la $a0, start
syscall

li $v0, 5
syscall
move $t0, $v0

#stop value
li $v0,4
la $a0, stop
syscall

li $v0, 5
syscall
move $t1, $v0

#step value
li $v0,4
la $a0, step
syscall

li $v0, 5
syscall
move $t2, $v0

loop:
bge $t0, $t1, endpgm

#print number
li $v0,1
move $a0, $t0
syscall

#print space
li $v0,4
la $a0, sp
syscall

add $t0, $t0, $t2
j loop

endpgm:
li $v0,10
syscall
