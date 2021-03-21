[org 0x7c00]
mov dx, 0x1fb6
call print_hex
jmp end
print_hex:
mov ah, 0x0e
mov bx, HEX_OUT
mov al, dl
cmp al, 0
je ret_here
int 0x10

jmp print_hex
ret_here:
ret

HEX_OUT: db '0x0000',0

end:

jmp $

times 510-($-$$) db 0
dw 0xaa55
