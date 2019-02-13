section	.data
	
section	.text

global _suma_int

extern _printf
        
_suma_int:    
    push ebp
    mov ebp,esp
    
    xor eax,eax
    mov eax , [ebp + 8]
    add eax , [ebp + 12]
    
    mov esp,ebp
    pop ebp
    ret