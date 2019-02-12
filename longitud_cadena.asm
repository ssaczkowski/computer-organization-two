
section .data
  string db "Hola como estas", 0
  fmt db "%08X", 10,0

section .text

global _main
extern _printf

; Calcula la longitud de una cadena
_main:
  push ebp
  mov ebp, esp
  push edi
  push ebx
  mov edi, string 
  xor eax, eax ; Inicializar longitud a cero

bucleContador:
  mov bl, [edi]
  cmp bl, 0
  je  fuera
  inc eax
  inc edi
  jmp bucleContador

fuera:
  pop ebx 
  pop edi
  
  push eax
  push dword fmt
  call _printf
  add esp , 8
  
  pop ebp 
  ret 