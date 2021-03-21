[org 0x7c00]

mov ah, 0x0e
mov bx, HELLO_MSG
call print_string

mov ah, 0x0e
mov bx, GOODBYE_MSG
call print_string

jmp $

%include "print_string.asm"


HELLO_MSG:
db 0x42, 0x6F, 0x6F, 0x74, 0x69, 0x6E, 0x67, 0x20, 0x4F, 0x53, 0xA, 0

GOODBYE_MSG:
db 'OS TARA',0

times 510-($-$$) db 0
dw 0xaax