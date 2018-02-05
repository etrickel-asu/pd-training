# this was created using the command
# initialally create using:
#    gcc -m32 -masm=intel -S v3simpleBOF.c -o v3simpleBOF.S
# -masm=intel means that the first variable recieves the value
# e.g., sub esp, 88  ==>     esp := esp - 88
	.file	"v3simpleBOF.c"
	.intel_syntax noprefix
	.section	.rodata
.OFSTR:
	.string	"overflow me : "
.BINSTR:
	.string	"/bin/sh"
.LC2:
	.string	"Nah.."
	.text
	.globl	func
	.type	func, @function    # we have a function named func
.LFE2: 
	.size	func, .-func
	.globl	main
	.type	main, @function    # we have a second function named main

func:
.LFB2:
	push	ebp
	mov	ebp, esp
	# end of func's prolog 
	sub	esp, 88
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	sub	esp, 12
	push	OFFSET FLAT:.OFSTR  # pushing string to pass to printf
	call	printf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-85]      # local variables usually ebp-XX
	push	eax		   # paramater to gets, 
	call	gets               # paramaters to gets are put onto stack

	add	esp, 16
	cmp	DWORD PTR [ebp+8], -22938914  # hmmm, a compare on some number
	jne	.FAIL        # if not eq, jump to FAIL
	sub	esp, 12
	push	OFFSET FLAT:.BINSTR     # string for shell call
	call	system
	add	esp, 16
	jmp	.GETOUT  
.FAIL:
	sub	esp, 12
	push	OFFSET FLAT:.LC2
	call	puts
	add	esp, 16
.GETOUT:
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.ALLISGOOD        # so if the stack still has a value
	                          # the progrm saved at the start of func
		                  # all is good and no stack failure
	                          # when this check fails, we get the
	                          # dreaded stack smashing detected message
	call	__stack_chk_fail
.ALLISGOOD:
	# func's epilog
	leave   # 1) mov esp, ebp  2) pop ebp
	ret     # pop eip  

main:
.LFB3:
	# stack alignment shenanigans
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	# start of mains prolog
	push	ebp
	mov	ebp, esp
	# end of main's prolog
	push	ecx
	sub	esp, 4
	sub	esp, 12
	push	-559038737      
	call	func
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
