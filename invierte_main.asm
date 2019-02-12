section .data


fmt db "El resultado es : %s", 10,0

section .text

global _main
extern _printf
extern _invierte

_main:
    push ebp
    mov ebp, esp
    
    call _invierte
   
    push eax
    push dword fmt
    call _printf
    add esp, 8
        
    pop ebp
    ret 