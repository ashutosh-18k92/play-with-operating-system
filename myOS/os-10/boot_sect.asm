[org 0x7c00]
; your code starts here
; a sample code to write a hex value on the 
; to print on screen


mov dx, 0xabcf
mov cx, 0
mov ah, 0x0e

loop_head:
cmp cx, 4
je print
mov bx, dx
and bx, 0x000f
add bx, 0x30

cmp bx, 0x39
jg gt9
jmp eval

gt9:
add bx, 0x7
jmp eval

eval:
mov al, bl
int 0x10
ror dx, 4
add cx,1
jmp loop_head

print:
mov ah, 0x0e
mov bx, out
mov al,[bx]
print_string:
cmp al,0
je end

int 0x10
add bx, 0x1
mov al, [bx]
jmp print_string

out:
db 'Booting OS',0


end:

jmp $ 

times 510-($-$$) db 0
dw 0xaa55
