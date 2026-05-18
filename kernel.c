void kernel_main(void) {
    // 0xA0000 is the memory address for VGA Graphics Mode pixels
    unsigned char* screen = (unsigned char*) 0xA0000;

    // Note: To truly switch modes, we usually need "Real Mode" or "VBE".
    // For now, let's simulate a UI layout in the current mode 
    // by drawing a "Window" using extended ASCII characters

    char* video_memory = (char*) 0xB8000;
    
    // Clear screen with a Dark Grey background
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';
        video_memory[i+1] = 0x88; 
    }

    // Draw a "Window" Box (A White rectangle in the middle)
    int start_x = 20;
    int start_y = 5;
    int width = 40;
    int height = 15;

    for (int y = start_y; y < start_y + height; y++) {
        for (int x = start_x; x < start_x + width; x++) {
            int offset = (y * 80 + x) * 2;
            video_memory[offset] = ' ';
            video_memory[offset + 1] = 0xF0; // White background, Black text
        }
    }
}
