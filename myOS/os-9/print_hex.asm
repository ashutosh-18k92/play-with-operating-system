print_hex:
pusha
mov dx, 0x1fb6
mov cx, 0

hex_loop:   ; hex loop starts here
cmp cx, 4
je end

mov ax, dx
and ax, 0x000f
add ax, 0x30

cmp al, 0x39
jg gt9
jmp loop_tail


gt9: 
add al, 7
jmp loop_tail


loop_tail:
mov bx, HEX_OUT+5; bx strores the last char's address
sub bx,cx ; each step we bring bx one char back
mov [bx],al
ror dx, 5
add cx, 1
jmp hex_loop

end:
mov bx, HEX_OUT
call print_string
popa
ret


; gloabl variables 
HEX_OUT:
db '0x0000',0





