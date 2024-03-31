SOURCE = boot.asm
OUTPUT = boot

INCLUDE_FILES = print_rm.asm print_pm.asm gdt.asm pm_switch.asm

NASM_FLAGS = -fbin
QEMU_FLAGS = format=raw,index=0,media=disk

all: nasm qemu

nasm: $(SOURCE) $(INCLUDE_FILES)
	nasm $(NASM_FLAGS) $(SOURCE) -o $(OUTPUT).bin

qemu: $(OUTPUT).bin
	qemu-system-x86_64 -drive file=$(OUTPUT).bin,$(QEMU_FLAGS)

clean:
	rm -f $(OUTPUT).bin

.PHONY: all clean
