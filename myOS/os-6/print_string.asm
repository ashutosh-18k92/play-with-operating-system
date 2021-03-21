print_string:
mov al, [bx]
cmp al, 0x0
je the_end
int 0x10
add bx, 0x1
jmp print_string

the_end:
ret
