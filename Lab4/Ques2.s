# MIPS program to find a particular elememt in the array

.data
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
len: .word 10
entermsg: .asciiz "Enter the element you want to find: "
found: .asciiz "The element is in index: "
notfound: .asciiz "The element is not available in the array."

.text
main:

#print entermsg 
li $v0, 4
la $a0, entermsg
syscall 

#take user input
li $v0, 5
syscall
move $t3,$v0

#initialize some variables
li $t0, 0  # i=0
la $t1, arr
lw $t2, len

loop:
beq $t0,$t2, nFound   
lw $t4, 0($t1)
beq $t4, $t3, yFound

addi $t0, $t0, 1
addi $t1, $t1, 4
j loop

nFound:
li $v0, 4
la $a0, notfound
syscall

j exitprog

yFound:
li $v0, 4
la $a0, found
syscall

li $v0, 1
move $a0, $t0
syscall

j exitprog

exitprog:
li $v0, 10
syscall
