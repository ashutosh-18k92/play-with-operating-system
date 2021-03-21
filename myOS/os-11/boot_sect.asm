[org 0x7c00]
; your code starts here
; usign BIOS to read the disk

mov ah, 0x02

mov dl, 0 ; Read drive 0 ( first floppy drive)
mov ch, 3 ; cylinder 3
mov dh, 0 ; select the side of the disk top=0 bottom =1
          ; since floppy is a single plattar device it has
          ; only two heads which can be chosen usign 0 or 1
mov cl, 4 ; select sector 4 : sectors starts with 1
mov al, 5 ; read 5 sectors from start

mov bx, 0xa000
mov es, bx ; set data register
mov bx, 0x1234

int 0x13

jc disk_error


cmp al, 5
jne disk_error
jmp disk_success




disk_error:
    mov bx, DISK_ERROR_MSG
    jmp print_string

disk_success:
    mov bx, DISK_SUCCESS
    jmp print_string
    


print_string:
    mov ah, 0x0e
    mov al, [bx]
    loop_head:
        cmp al, 0
        je end
        int 0x10
        add bx, 0x1
        mov al, [bx]
    jmp loop_head
    
    
    

end:

jmp $ 

DISK_ERROR_MSG:
    db "Disk read error!",0

DISK_SUCCESS:
    db "Read successful",0



times 510-($-$$) db 0
dw 0xaa55
