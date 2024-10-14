#Print a String

.data
msg: .asciiz "I love plushies and chocolates"

.text
main:

li $v0,4
la $a0,msg
syscall

li $v0,10
syscall
