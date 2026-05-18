void kernel_main(void) {
    // 0xB8000 is the memory address where the graphics card looks for text to display.
    // 'volatile' tells the compiler not to optimize this away, because we are talking to physical hardware.
    volatile char* video_memory = (volatile char*) 0xB8000;

    // The message we want to display on our custom OS
    const char* message = "Hello from your custom OS kernel!";
    
    // Each character on screen takes up 2 bytes of memory:
    // Byte 1: The ASCII character code (e.g., 'H')
    // Byte 2: The color attribute (0x0A means light green text on a black background)
    for(int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];       // Write the character text
        video_memory[i * 2 + 1] = 0x0A;         // Write the green color style
    }
}
