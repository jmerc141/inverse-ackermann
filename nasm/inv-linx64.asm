; Inverse Ackermann function


global main
extern printf

section .data
	error_msg db "Please run again with 1 parameters", 10, 0
	msg  db "Inverse Ackermann(%llu) = %llu", 10, 0


section .bss
	n resq 1


section .text
main:
	; check for 3 arguments
	cmp rbp, 2
	jne errmsg

	; get first argument
	mov rdi, [rsi+8]
	mov [n], rdi

	; convert arg to integer
	mov rsi, [n]
	call .strtoull_custom
	mov [n], rax

	mov rdi, [n]
	mov rax, 0
	call inverse
	
	;(rdi)printf(rsi, rdx, rcx, r8)
	mov rsi, [n]
	mov rdx, rax
	push rbp
	lea rdi, [msg]
	;lea rsi, [rel msg]
	call printf wrt ..plt
	mov rax, 0
	pop rbp

	ret


.strtoull_custom:							; rsi = string
    xor rax, rax     ; Clear rax (result)
    xor rcx, rcx     ; Clear rcx (digit)

.convert_loop:
    movzx rcx, byte [rsi]  ; Load the next byte from the string
    test rcx, rcx          ; Check if it is the null terminator
    jz .conversion_done    ; If null terminator, conversion is done
    
    sub rcx, '0'           ; Convert ASCII to integer
    cmp rcx, 9
    ja .conversion_done    ; If not a valid digit, conversion is done
    
    imul rax, rax, 10      ; Multiply result by 10
    add rax, rcx           ; Add the digit to the result
    
    inc rsi                ; Move to the next character
    jmp .convert_loop      ; Repeat the loop

.conversion_done:
    ;mov [res], rax      ; Store the result
    ret

	
inverse:
	cmp rdi, 4
	jle .base_case
	
	push rdi
	dec rdi
	push rbp
	call inverse		;get a=inverse(n-1)
	pop rbp
	
	pop rdi
	sub rdi, 2
	push rbp
	call inverse		;get b=inverse(n-2)
	pop rbp
	
	ret

.base_case:
	add rax, rdi		;add base case to total sum
	ret


errmsg:
	;printf(rcx, rdx, r8, r9)
	mov rdi, error_msg
	
	push rbp
	call printf
	pop rbp

	xor rdi, rdi
	ret
