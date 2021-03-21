[org 0x7c00]
; your code starts here
[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f
mov ebx, MSG
print_string_pm:
pusha
mov edx, VIDEO_MEMORY

print_string_pm_loop:

mov al, [ebx]
mov ah, WHITE_ON_BLACK

cmp al,0
je print_string_pm_done

mov [edx],ax
add ebx, 1
add edx, 2
jmp print_string_pm_loop

print_string_pm_done:
popa
ret


jmp $ 

MSG:
db 'Hello',0

times 510-($-$$) db 0
dw 0xaa55
