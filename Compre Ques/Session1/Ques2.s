#MIPS program to print the first 5 letters of a string

.data
msg: .asciiz "applepie"  
output: .asciiz "The first 5 characters are: "
newline: .asciiz "\n"  

.text
.globl main

main:
    la $t0, msg        
    li $t1, 0          

find_len:
    lb $t2, 0($t0)      
    beq $t2, $zero, done_len  
    addi $t0, $t0, 1    
    addi $t1, $t1, 1    
    j find_len

done_len:
    li $t2, 6   
    li $t6, 1        
    la $t4, msg         
    li $v0, 4           
    la $a0, output      
    syscall

print_chars:
    lb $t5, 0($t4)      
    beq $t2, $t6, done_print  
    li $v0, 11          
    move $a0, $t5       
    syscall
    addi $t4, $t4, 1
    addi $t6, $t6, 1    
    j print_chars

done_print:
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
