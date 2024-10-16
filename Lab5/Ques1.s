# MIPS program to print the largest and smallest elements in an array


.data
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
large: .asciiz "The largest element in the array is: "
small: .asciiz "The smallest element in the array is: "
len: .word 10
nl: .asciiz "\n"

.text
main:

la $t0, arr
lw $t1, 0($t0)  # Load the first element of A into $t1
move $t2, $t1   # Initialize largest with first element of A
move $t3, $t1   # Initialize smallest with first element of A

li $t4, 0      # i=0
lw $t5, len

loop:
beq     $t4, $t5, endfind
lw      $t6, 0($t0)
bgt     $t6, $t2, updatelarge
blt     $t6, $t3, updatesmall

next:
addi $t0,$t0,4
addi $t4, $t4,1
j loop

updatelarge:
move $t2, $t6
j next

updatesmall:
move $t3, $t6
j next

endfind:

#print the smallest and the largest numbers
li $v0,4
la $a0, large
syscall

li $v0,1
move $a0, $t2
syscall

li $v0,4
la $a0, nl
syscall 

li $v0,4
la $a0, small
syscall

li $v0,1
move $a0, $t3
syscall

li $v0,10
syscall
