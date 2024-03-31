[org 0x7c00]

    mov bp, 0x9000      ; set the stack somewhere safe
    mov sp, bp

    mov bx, MSG_RM
    call print_string_rm

    call switch_to_pm

%include "print_rm.asm"
%include "print_pm.asm"
%include "gdt.asm"
%include "pm_switch.asm"

[bits 32]
begin_pm:
    mov ebx, MSG_PM
    call print_string_pm

    jmp $

MSG_RM db "Starting in real mode", 0
MSG_PM db "Loaded protected mode", 0

times 510-($-$$) db 0
dw 0xaa55
