[bits 32]
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_pm_done

    mov [edx], ax       ; store char and attributes at current char cell
    add ebx, 1          ; get next char in string
    add edx, 2          ; move to next char cell in video memory
    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret

VIDEO_MEMORY    equ 0xb8000
WHITE_ON_BLACK  equ 0x0f
