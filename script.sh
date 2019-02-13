nasm -f macho32 hello_world.asm -o hello_world.o 
ld -lc -arch i386  hello_world.o -o hello_world -macosx_version_min 10.13 -lSystem
./hello_world

nasm -f macho32 longitud_cadena.asm -o longitud_cadena.o 
ld -lc -arch i386  longitud_cadena.o -o longitud_cadena -macosx_version_min 10.13 -lSystem 
./longitud_cadena

nasm -f macho32 invierte_main.asm -o invierte_main.o
nasm -f macho32 invierte.asm -o invierte.o
ld -lc -arch i386  invierte_main.o invierte.o -o invierte_main -macosx_version_min 10.13 -lSystem 
./invierte_main


nasm -f macho32 -o suma_int.o suma_int.asm
gcc -m32  -o print_suma_int suma_int.o print_suma.c
./print_suma_int