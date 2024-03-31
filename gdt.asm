gdt_start:

gdt_null_descriptor:
    dd 0x0
    dd 0x0

gdt_code_descriptor:
    ; base=0x0, limit=0xfffff,
    ; present=1 privilege_level=00 descriptor_type=1 (1001b)
    ; code=1 conforming=0 readable=1 accessed=0 (1010b)
    ; granularity=1 32-bit_default=1 64-bit_seg=0 AVL=0 (1100b)
    dw 0xffff       ; Limit (bits 0-15)
    dw 0x0          ; Base (bits 0-15)
    db 0x0          ; Base (bits 16-23)
    db 0b1001_1010  ; 1st flags and type flags
    db 0b1100_1111  ; 2nd flags and Limit (bits 16-19)
    db 0x0          ; Base (bits 24-31)

gdt_data_descriptor:
    ; same as the code segment except for the type flags
    ; code=0 expand_down=0 writeable=1 accessed=0 (0010b)
    dw 0xffff
    dw 0x0
    db 0x0
    db 0b1001_0010
    db 0b1100_1111
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; size of our GDT is always less one of the true size
    dd gdt_start

CODE_SEG equ gdt_code_descriptor - gdt_start
DATA_SEG equ gdt_data_descriptor - gdt_start
