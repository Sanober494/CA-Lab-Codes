#MIPS program to print the sum of the corresponding elements from two arrays.

.data
A:      .word 1, 2, 3, 4, 5
B:      .word 1, 2, 3, 4, 5
C:      .space 20
len:    .word 5
summsg: .asciiz "The sum is:\n"
sp: .asciiz " "

.text
main:
    la      $t0, A
    la      $t1, B
    la      $t2, C

    li      $t3, 0   # i=0
    lw      $t4, len

#print sum msg
    li      $v0, 4
    la      $a0, summsg
    syscall

sumloop:
    beq     $t3, $t4, endsum

#loading A[i] and B[i]
    lw      $t5, 0($t0)
    lw      $t6, 0($t1)
    add     $t7, $t5, $t6
    sw      $t7, 0($t2)    #storing it in arr3 -> C

#print C[i]
    li      $v0, 1
    move    $a0, $t7
    syscall

#print space for better visibility
li $v0, 4
la $a0, sp
syscall

#increment the values
    addi    $t3, $t3, 1   #i+=1
    addi    $t0, $t0, 4
    addi    $t1, $t1, 4
    addi    $t2, $t2, 4
    j       sumloop

endsum:
    li      $v0, 10
    syscall
