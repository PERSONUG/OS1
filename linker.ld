ENTRY(_start)

SECTIONS
{
    /* Most bootloaders expect the kernel to be loaded at 1 Megabyte (0x100000) */
    . = 1M;

    /* First put the multiboot header, then the core code executable text */
    .text : BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    /* Read-only data (like our text string) */
    .rodata : BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    /* Initialized data */
    .data : BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
    }

    /* Uninitialized data (like our stack memory) */
    .bss : BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
}
