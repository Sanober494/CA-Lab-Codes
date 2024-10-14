#Print an Integer

.data
msg: .word 44

.text
main:

li $v0,1
lw $a0,msg
syscall

li $v0,10
syscall
