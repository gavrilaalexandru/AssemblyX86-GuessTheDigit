.model small
.stack 100h
.data
    msg1 db 'Primul jucator sa introduca o cifra (0-9): $'
    msg2 db 'Al doilea jucator poate incepe sa ghiceasca cifra: $'
    mai_mare db 'Prea mare!$'
    mai_mic db 'Prea mica!$'
    corect db 'Felicitari! Al doilea jucator castiga!$'
    newline db 13, 10, '$'
    numar db ?

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 08h
    int 21h
    sub al, '0'
    mov numar, al

    mov ah, 09h
    lea dx, newline
    int 21h

ghiceste:
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'    

    push ax     
    mov ah, 09h
    lea dx, newline
    int 21h
    pop ax

    cmp al, numar
    je corect_label
    jb mic_label

mare:
    mov ah, 09h
    lea dx, mai_mare
    int 21h
    jmp cont

mic_label:
    mov ah, 09h
    lea dx, mai_mic
    int 21h
    jmp cont

corect_label:
    mov ah, 09h
    lea dx, corect
    int 21h
    jmp sfarsit

cont:
    mov ah, 09h
    lea dx, newline
    int 21h
    jmp ghiceste

sfarsit:
    mov ah, 4ch
    int 21h
end start
