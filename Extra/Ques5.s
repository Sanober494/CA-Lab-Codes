#simple function

.data
msg: .asciiz "Hello Duniya!"

.text
main:

jal dispmsg

dispmsg:
li $v0,4
la $a0, msg
syscall

li $v0,10
syscall
