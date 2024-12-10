#MIPS code to write a Leaf procedure to calculate x²+y²+z²+xyzw

.data
msg_x: .asciiz "Enter the value of x: "
msg_y: .asciiz "Enter the value of y: "
msg_z: .asciiz "Enter the value of z: "
msg_w: .asciiz "Enter the value of w: "
result_msg: .asciiz "The result of the calculation is: "
result: .word 0

.text

main:
    li $v0, 4
    la $a0, msg_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg_y
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg_z
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, msg_w
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    jal calculate_expression

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $v1
    syscall

    li $v0, 10
    syscall

calculate_expression:
    mul $t4, $t0, $t0
    mul $t5, $t1, $t1
    mul $t6, $t2, $t2
    mul $t7, $t0, $t1
    mul $t8, $t7, $t2
    mul $t9, $t8, $t3

    add $s0, $t4, $t5
    add $s1, $s0, $t6
    add $v1, $s1, $t9

    jr $ra
