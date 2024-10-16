# MIPS program to print the elements of an array

.data
arr: .word 1, 24, 56, 78, 90, 100, 323, 46, 56, 54 
len: .word 10
newL: .asciiz "\n"

.text
main:
li $t0,0        # $t0 = i (index), initialize i to 0
la $t1, arr     # Load the address of the array into $t1
lw $t2, len

loop:
beq $t0,$t2, endprog      # If i == length, end the loop
lw $t3, 0($t1)        # Load the array[i] into $t3

# Print the array[i] value
li $v0,1 
move $a0, $t3
syscall

#print new line
li $v0,4
la $a0,newL
syscall

#move to the next array element
addi $t0,$t0,1   # i = i + 1
addi $t1,$t1,4  #address + 4 bytes
j loop

endprog:
li $v0, 10
syscall
