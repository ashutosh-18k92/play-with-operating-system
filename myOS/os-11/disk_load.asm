; prgram to read a sector from floppy disk

[org 0x7c00]
; your code starts here
; usign BIOS to read the disk

mov ah, 0x02  ; disk reading interrupt routine provided by BIOS


; here two registers are used to specify the data cordinates
; <dh=HEAD, dl=SIDE, ch=CYLINDER, cl=SECTOR,al=SECTORS_TO_READ>
mov dl, 0 ; Read drive 0 ( first floppy drive)
mov ch, 3 ; cylinder 3
mov dh, 0 ; select the side of the disk top=0 bottom =1
          ; since floppy is a single plattar device it has
          ; only two heads which can be chosen usign 0 or 1
mov cl, 4 ; select sector 4 : sectors starts with 1
mov al, 5 ; read 5 sectors from start

mov bx, 0xa000 ; to set the data segment register
mov es, bx ; set data segment register
mov bx, 0x1234

int 0x13 ; interrupt to read disk specified by dx,cx,

jc disk_error ; jump if carry bit is set


cmp al, 5           ; compare contents of al with 5 
jne disk_error         ; if not equal jmp ot disk error
jmp disk_success  ; else jmp to disk success




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
