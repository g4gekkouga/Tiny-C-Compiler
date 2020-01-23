	.file	"output.s"

	.text
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$28, %rsp
	movl	%edi, -4(%rbp)
# 11:res = t006 
	movl	$0, -8(%rbp)
# 12:arg1 = n arg2 = t006 
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
	cmpl	%edx, %eax
	je .L1
# 13:
	jmp .L2
# 14:
	jmp .L2
# 15:res = t007 
.L1:
	movl	$1, -12(%rbp)
# 16:res = t007 
	movl	-12(%rbp), %eax
	jmp	.LRT0
# 17:
	jmp .L2
# 18:res = t008 
.L2:
	movl	$1, -16(%rbp)
# 19:res = t009 arg1 = n arg2 = t008 
	movl	-4(%rbp), %eax
	movl	-16(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
# 20:res = t009 
# 21:res = t010 
	pushq %rbp
	movl	-20(%rbp) , %edi
	call	factorial
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 22:res = t011 arg1 = n arg2 = t010 
	movl	-4(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
# 23:res = t011 
	movl	-28(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-28, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	factorial, .-factorial
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
# 0:res = t000 arg1 = num 
	leaq	-4(%rbp), %rax
	movq	%rax, -12(%rbp)
# 1:res = t000 
# 2:res = t001 
	pushq %rbp
	movq	-12(%rbp), %rdi
	call	readInt
	movl	%eax, -16(%rbp)
	addq $0 , %rsp
# 3:res = num 
# 4:res = t002 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	factorial
	movl	%eax, -20(%rbp)
	addq $0 , %rsp
# 5:res = out arg1 = t002 
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
# 6:res = t003 arg1 = t002 
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
# 7:res = out 
# 8:res = t004 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printInt
	movl	%eax, -28(%rbp)
	addq $0 , %rsp
# 9:res = t005 
	movl	$0, -32(%rbp)
# 10:res = t005 
	movl	-32(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-32, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
