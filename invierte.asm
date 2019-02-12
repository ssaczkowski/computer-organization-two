section .data

cadena db "HOLA", 0
longitud db 8

section .text

global _invierte


_invierte:
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edi
  push esi

  ; Copiar la longitud de la cadena a ECX y copiar la 
  ; direccion inicial de la cadena a EDI
  xor ecx,ecx
  mov ecx, [longitud]
  mov edi, cadena
  


  ; Hacer que el registro esi apunte al ultimo caracter de la cadena
  mov esi, edi
  add esi, ecx
  dec esi
  

  ; Dividir entre dos la longitud de la cadena para saber cuando parar de
  ; intercambiar caracteres
  shr ecx, 1

  ; Bucle principal de intercambio de caracteres
intercambiar:
  ; Intercambiar los 2 caracteres que toquen
  mov bl, [esi]
  mov bh, [edi]
  mov [esi], bh
  mov [edi], bl
  
  ; Hacer que esi y edi apunten a los 2 caracteres siguientes a intercambiar
  inc edi
  dec esi
  
  dec ecx    
  cmp ecx,0
  jnz intercambiar
  
  
  mov eax, edi
  pop esi
  pop edi
  pop ecx
  pop ebx
  pop ebp
  ret 