#MIPS program to print the sum of the elements of the array

.data
arr:      .word 1, 2, 3, 4, 5
len:    .word 5
summsg: .asciiz "The sum of the array elements is: "

.text
main:
    la      $t0, arr
    li      $t1, 0
    li      $t2, 0
    lw      $t3, len

loop:
    beq     $t2, $t3, endloop
    lw      $t4, 0($t0)
    add     $t1, $t1, $t4
    addi    $t0, $t0, 4
    addi    $t2, $t2, 1
    j       loop

endloop:
    li      $v0, 4
    la      $a0, summsg
    syscall

    li      $v0, 1
    move    $a0, $t1
    syscall

    li      $v0, 10
    syscall
