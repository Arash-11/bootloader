[bits 16]
switch_to_pm:
    cli                     ; disable all maskable hardware interrupts

    lgdt [gdt_descriptor]

    mov eax, cr0
    or eax, PE_BIT
    mov cr0, eax

    jmp CODE_SEG:init_pm    ; make a far jump to flush the CPU's prefetch input queue

[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000        ; update our stack position so it's near the top of the free space
    mov esp, ebp

    call begin_pm

PE_BIT equ 0b1
