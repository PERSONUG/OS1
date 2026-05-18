# ChangeThis OS
ChangeThis OS is an open-souce kernel OS developed by PERSONUG. It contains all the files you need to create a bootable operating system kernel.





## Features
* **Custom Kernel:** Written in C and Assembly.
* **Multiboot Compliant:** Boots using the GRUB bootloader.
* **Modern UI:** Features a blue "Desktop" environment, a grey taskbar, and a centered system window.
* **No Soldering Required:** Purely software-based emulation using QEMU.

## 🛠 Tech Stack
* **Language:** C (Kernel logic) & NASM (Bootstrap code)
* **Compiler:** GCC (cross-compiler for i386)
* **Bootloader:** GNU GRUB
* **Emulator:** QEMU

## How to Build & Run
If you are using GitHub Codespaces
You can run the following command in the terminal to compile the kernel and launch the OS:

```bash
nasm -f elf32 boot.asm -o boot.o && \
gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra && \
ld -m elf_i386 -T linker.ld -o myos.bin boot.o kernel.o && \
mkdir -p isodir/boot/grub && \
cp myos.bin isodir/boot/myos.bin && \
cp isodir/boot/grub.cfg isodir/boot/grub/grub.cfg && \
grub-mkrescue -o ChangeThisOS.iso isodir && \
qemu-system-i386 -cdrom ChangeThisOS.iso -display curses

```
## Otherwise
You can get an ISO file and run it in a VM, emulator or boot it on a computer.


## USES
You can modify the code however you like and can change it to create a modern operating system, similar to Windows or MacOS, or you can create a custom OS. This is yours to modify.

## *Developed by @PERSONUG*
