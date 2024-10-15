; Inverse Ackermann function
; Uncomment line 19 and 51 to see Calls


global  _start
extern  printf

section .data
	msg  db "Inverse Ackermann(%llu) = %llu, Calls: %llu", 10, 0
	n    dq 54


section .bss
	a resq 1


section .text
inverse:
	;inc r10
	cmp rdi, 4
	jle .base_case
	
	push rdi
	dec rdi
	call inverse		;get a=inverse(n-1)
	
	;mov rbx, rax		;not needed
	pop rdi
	sub rdi, 2
	call inverse		;get b=inverse(n-2)
	;add rax, rbx		;not needed
	
	ret

.base_case:
	add rsi, rdi		;add base case to total sum
	ret

;Basically cannot get command line parameters on Windows 64 bit
_start:
	mov rdi, [n]
	mov r10, 0
	mov rsi, 0
	
	call inverse
	
	;printf
	mov rcx, msg
	mov rdx, [n]
	mov r8, rsi
	;mov r9, r10
	sub rsp, 32
	call printf
	add rsp, 32

	ret

	
