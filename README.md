# x-86-assembly-programs-nasm-gcc

Low Level Assembly Programs Using NASM and GCC

# Instruction

1. To run these programs your system must have installed NASM and GCC.

2. Open file with any terminal as per your convinience.

3. Save the file.

4. Open terminal having path as same folder.

5. To run type below commands:
```

$ nasm -felf32 file_name.asm

$ gcc -m32 file_name.o

$ ./a.out
```

6. To debug program use below commands:
```

$ nasm -felf32 -g -Fdwarf file_name.asm

$ gcc -m32 -g -Fdwarf file_name.o

$ ./a.out
```

