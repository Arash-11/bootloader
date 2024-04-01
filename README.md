# Simple x86 bootloader

- [x] Print to screen in 16-bit real mode using BIOS interrupts.
- [ ] Enable the A20-line.
- [ ] Set up the interrupt descriptor table.
- [x] Set up the global descriptor table.
- [x] Switch to 32-bit protected mode.
- [x] Print to screen in 32-bit protected mode using video RAM.

Uses NASM and QEMU. To run, install NASM and QEMU, and then just run `make`.
