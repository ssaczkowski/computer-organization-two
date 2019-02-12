
section .data
  Cadena1 DB "Hola amigos 123", 0
  Cadena2 DB "29-mayo-2004", 0
  Cadena3 DB "Asturias patria querida", 0

section .text
global _main


; Procedimiento que invierte los caracteres
; de una cadena
Invierte proc
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edi
  push esi

  ; Copiar la longitud de la cadena desde la pila a ECX y copiar la 
  ; direcci�n inicial de la cadena desde la pila a EDI
  mov ecx, [ebp+8] 
  mov edi, [ebp+12]


  ; Hacer que el registro esi apunte al ultimo car�cter de la cadena
  mov esi, edi
  add esi, ecx
  dec esi

  ; Dividir entre dos la longitud de la cadena para saber cu�ndo parar de
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

  loop intercambiar

  pop esi
  pop edi
  pop ecx
  pop ebx
  pop ebp
  ret 8
Invierte endp

; Programa principal
_main:
  ; Invertir Cadena1
  push offset Cadena1
  call Longitud
  push offset Cadena1
  push eax
  call Invierte

  ; Invertir Cadena2
  push offset Cadena2
  call Longitud
  push offset Cadena2
  push eax
  call Invierte

  ; Invertir Cadena3
  push offset Cadena3
  call Longitud
  push offset Cadena3
  push eax
  call Invierte

  push 0
  call ExitProcess
  ret