print_string_rm:
    pusha                       ; save all general registers on the stack

print_string_rm_loop:           ; loop through the chars of the string stored at `bx`
    mov al, [bx]
    cmp al, 0
    je print_string_rm_done

    mov ah, 0x0e
    int 0x10

    add bx, 1                   ; increment pointer for next iteration of the loop
    jmp print_string_rm_loop

print_string_rm_done:
    popa
    ret
