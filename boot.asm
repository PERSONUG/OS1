; --- Multiboot Header Configuration ---
MODULEALIGN equ  1 << 0                   ; Align loaded modules on page boundaries
MEMINFO     equ  1 << 1                   ; Provide memory map to the kernel
FLAGS       equ  MODULEALIGN | MEMINFO    ; Combine the flags
MAGIC       equ  0x1BADB002               ; 'Magic' number lets the bootloader find the header
CHECKSUM    equ -(MAGIC + FLAGS)          ; Checksum to prove we are multiboot compatible

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

; --- Creating Storage Space (Stack) ---
section .bss
align 16
stack_bottom:
resb 16384                                ; Reserve 16 Kilobytes of memory for the stack
stack_top:

; --- The Entry Point ---
section .text
global _start
extern kernel_main                        ; This tells Assembly that 'kernel_main' is in our C file

_start:
    mov esp, stack_top                    ; Point the stack pointer to the top of our reserved memory
    call kernel_main                      ; Jump out of Assembly and execute our C kernel

.halt_loop:
    cli                                   ; Clear interrupts
    hlt                                   ; Halt the CPU if the C kernel ever finishes
    jmp .halt_loop                        ; Security loop to make sure the CPU stays stopped
