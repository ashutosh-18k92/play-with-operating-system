[org 0x7c00]
mov ah, 0x0e

; First Attempt - Fail
mov al, the_secret  ; loading offset address into al
int 0x10

; Second attempt - Fail
mov al, [the_secret]  ; [] are used to get the contents of an addr
                      ; here CPU is calculating the content of the_secret from
                      ; the base 0 of the memory rathter than the code.
int 0x10

;Third attempt - Success
mov bx, the_secret  ; gets the address of the_secret
add bx, 0x7c00 ; adds the base address of the code 
mov al, [bx] ; bx now stores the address of the_secret from the base 0 of memory
int 0x10

;Fourth attempt - Success
mov al, [0x7c1e]   ; here we have used the effective address of the label and 
                   ; stored the contents of 0x7c1e into al
int 0x10

jmp $   ; move to the base address of the code.

the_secret: ; labels provide a convinient offset from the start of the code 
            ; to the code to particular instruction or data
db "X"      ; declare bytes of data, which tells the assembler to write the subsequent 
            ;bytes directly to the binary output file 
            ; do not interpret them as processor instructions
            ; surrounded by double quotes asmblr converts each character to ASCII code

times 510-($-$$) db 0
dw 0xaa55
