#MIPS program to print the last 5 letters of string

.data
msg: .asciiz "applepie"  
output: .asciiz "The last 5 characters are: "
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
    li $t2, 5           
    sub $t3, $t1, $t2   
    la $t4, msg         
    add $t4, $t4, $t3    

    li $v0, 4           
    la $a0, output      
    syscall

print_chars:
    lb $t5, 0($t4)      
    beq $t5, $zero, done_print  
    li $v0, 11          
    move $a0, $t5       
    syscall
    addi $t4, $t4, 1    
    j print_chars

done_print:
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
