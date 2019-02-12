section	.data
msg db 'Hello, world!',10,0
fmt db "%s", 10,0

	
section	.text

global _main

extern _printf
        
_main:    ;Alineo pila a 16 = 4 retorno + 8 msg y fmt  (Convencion de llamadas en IA-32)
    sub esp, 4
   
    push msg
    push dword fmt
    call _printf
    add esp, 12 ; elimino arguentos
        
    ret