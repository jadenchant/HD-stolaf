	.section .rodata
	.align	2
prompt:				@ prompt
	.asciz	"Input a line with 2 or more characters:"

	.data			@ allocate 100 bytes to buff
	.align	2
buff:
	.skip	100

	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ init stack
	add	fp, sp, #4
	@ sub	sp, sp, #8	@ 0 local var

	ldr	r0, promptP	@ print prompt
	bl	puts

	ldr	r0, buffP	@ call get_line()
	mov	r1, #100
	bl	get_line

	ldr	r0, buffP	@ call put_byte()
	mov	r1, #1		
	mov	r2, #'X'
	bl	put_byte

	ldr	r0, buffP	@ print buff
	bl	puts		

	mov	r0, #0		@ teardown stack
	sub	sp, fp, #4
	pop	{fp, pc}

	.align 2		@ pointers
promptP:
	.word	prompt
buffP:
	.word	buff
