#MIPs program to get one number from the user and then calculate A[0]*x³ + A[1]*x² + A[2]*x¹ + A[3]  on an array.

.data 
num: .asciiz "Enter a number: "
arr: .word 1, 2, 3, 4
result: .asciiz "The solution is: "

.text
main:

#Take the user input
li $v0, 4
la $a0, num
syscall

li $v0, 5
syscall
move $t2, $v0

#Calculate the address of the array
la $t0, arr
lw $t3, 0($t0)
lw $t4, 4($t0)
lw $t5, 8($t0)
lw $t6, 12($t0)

#calculate x^2 and x^3
mul $t7, $t2, $t2   # x^2
mul $t8, $t7, $t2   # x^3

# Calculate the individual values
mul $t3, $t3, $t8     # A[0] * x^3
mul $t4, $t4, $t7     # A[1] * x^2
mul $t5, $t5, $t2     # A[2] * x
add $t9, $t3, $t4     # t9 = A[0]*x^3 + A[1]*x^2
add $t1, $t9, $t5    # t10 = A[0]*x^3 + A[1]*x^2 + A[2]*x
add $s0, $t1, $t6   # t11 = A[0]*x^3 + A[1]*x^2 + A[2]*x + A[3]

#print the result
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $s0
syscall

li $v0, 10
syscall

