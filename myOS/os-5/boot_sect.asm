; using comparisons
%include "aux.asm"

mov al, 'S'
call my_print_function

mov al, 'K'
jmp print
ret_pt:
jmp prg

print:
mov ah, 0x0e
int 0x10
jmp ret_pt


prg:
mov bx, 30

cmp bx, 4
jle set_a

cmp bx, 40
jl set_b
jmp set_c

set_a:
    mov al, 'A'
    jmp the_end
set_b: 
    mov al, 'B'
    jmp the_end
set_c:
    mov al, 'C'
    jmp the_end


    
the_end:
mov ah, 0x0e
int 0x10


jmp $

times 510-($-$$) db 0
dw 0xaa55
