; Printing a string 
; we declare a string under a label and terminate with null, so that as we iterate 
; the string to print it, we know exactly when to stop.

mov ah, 0x0e

mov bp, 0x8000 ; set the base pointer of the stack a little abot where BIOS 
                ; loads out boot sector - so ti won't overwirite us
mov sp, bp

push 'A'
push 'B'
push 'C'

;pop bx
;mov al, bl
;int 0x10

;pop bx 
;mov al, bl
;int 0x10

mov al, [0x8000]
int 0x10

mov al, [0x7ffe]
int 0x10

mov al, [0x7ffc]
int 0x10

jmp $

my_string: 
db 'Booting OS',0

times 510-($-$$) db 0
dw 0xaa55
