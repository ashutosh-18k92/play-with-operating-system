[org 0x7c00]

%include "print_hex.asm"
%include "print_string.asm"

mov ah, 0x0e
mov dx, 0x1fb6 ; store the value to print in dx
call print_hex 
jmp $ 

times 510-($-$$) db 0
dw 0xaa55
