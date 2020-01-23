	.file	"output.s"

	.text
	.globl	max
	.type	max, @function
max:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
# 15:arg1 = a arg2 = b 
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jg .L1
# 16:
	jmp .L2
# 17:
	jmp	.LRT0
# 18:res = a 
.L1:
	movl	-8(%rbp), %eax
	jmp	.LRT0
# 19:
	jmp	.LRT0
# 20:res = b 
.L2:
	movl	-4(%rbp), %eax
	jmp	.LRT0
# 21:
	jmp	.LRT0
.LRT0:
	addq	$-8, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	max, .-max
	.globl	min
	.type	min, @function
min:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$20, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
# 22:res = a 
.L3:
# 23:res = b 
# 24:res = t008 
	pushq %rbp
	movl	-4(%rbp) , %edi
	movl	-8(%rbp) , %esi
	call	max
	movl	%eax, -16(%rbp)
	addq $0 , %rsp
# 25:res = temp arg1 = t008 
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
# 26:res = t009 arg1 = t008 
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
# 27:arg2 = a 
	movl	-16(%rbp), %eax
	movl	-8(%rbp), %edx
	cmpl	%edx, %eax
	je .L4
# 28:
	jmp .L5
# 29:
	jmp	.LRT1
# 30:res = b 
.L4:
	movl	-4(%rbp), %eax
	jmp	.LRT1
# 31:
	jmp	.LRT1
# 32:res = a 
.L5:
	movl	-8(%rbp), %eax
	jmp	.LRT1
# 33:
	jmp	.LRT1
.LRT1:
	addq	$-20, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	min, .-min
	.globl	fact
	.type	fact, @function
fact:
.LFB2:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$28, %rsp
	movl	%edi, -4(%rbp)
# 34:res = t010 
.L6:
	movl	$0, -8(%rbp)
# 35:arg1 = n arg2 = t010 
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
	cmpl	%edx, %eax
	je .L7
# 36:
	jmp .L8
# 37:
	jmp .L8
# 38:res = t011 
.L7:
	movl	$1, -12(%rbp)
# 39:res = t011 
	movl	-12(%rbp), %eax
	jmp	.LRT2
# 40:
	jmp .L8
# 41:res = t012 
.L8:
	movl	$1, -16(%rbp)
# 42:res = t013 arg1 = n arg2 = t012 
	movl	-4(%rbp), %eax
	movl	-16(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
# 43:res = t013 
# 44:res = t014 
	pushq %rbp
	movl	-20(%rbp) , %edi
	call	fact
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 45:res = t015 arg1 = n arg2 = t014 
	movl	-4(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
# 46:res = t015 
	movl	-28(%rbp), %eax
	jmp	.LRT2
.LRT2:
	addq	$-28, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE2:
	.size	fact, .-fact
	.globl	main
	.type	main, @function
main:
.LFB3:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
# 0:res = t000 
	movl	$10, -8(%rbp)
# 1:res = t001 
	movl	$20, -16(%rbp)
# 2:res = a 
# 3:res = b 
# 4:res = t002 
	pushq %rbp
	movl	-12(%rbp) , %edi
	movl	-4(%rbp) , %esi
	call	max
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 5:res = a 
# 6:res = b 
# 7:res = t003 
	pushq %rbp
	movl	-12(%rbp) , %edi
	movl	-4(%rbp) , %esi
	call	max
	movl	%eax, -32(%rbp)
	addq $0 , %rsp
# 8:res = t004 
	movl	$5, -36(%rbp)
# 9:res = t004 
# 10:res = t005 
	pushq %rbp
	movl	-36(%rbp) , %edi
	call	fact
	movl	%eax, -40(%rbp)
	addq $0 , %rsp
# 11:res = c arg1 = t005 
	movl	-40(%rbp), %eax
	movl	%eax, -20(%rbp)
# 12:res = t006 arg1 = t005 
	movl	-40(%rbp), %eax
	movl	%eax, -44(%rbp)
# 13:res = t007 
	movl	$0, -48(%rbp)
# 14:res = t007 
	movl	-48(%rbp), %eax
	jmp	.LRT3
.LRT3:
	addq	$-48, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE3:
	.size	main, .-main
