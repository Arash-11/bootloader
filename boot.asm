[org 0x7c00]

    mov bp, 0x9000      ; set the stack somewhere safe
    mov sp, bp

    mov bx, MSG_RM
    call print_string_rm

    jmp $

%include "print_rm.asm"

MSG_RM db "Starting in real mode", 0

times 510-($-$$) db 0
dw 0xaa55
