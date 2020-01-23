	.file	"output.s"

	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$56, %rsp
# 0:res = t000 
	movl	$1, -8(%rbp)
# 1:res = t001 
	movl	$2, -16(%rbp)
# 2:arg1 = number1 arg2 = number2 
	movl	-4(%rbp), %eax
	movl	-12(%rbp), %edx
	cmpl	%edx, %eax
	jg .L1
# 3:
	jmp .L2
# 4:
	jmp .L3
# 5:arg1 = number1 arg2 = number2 
.L1:
	movl	-4(%rbp), %eax
	movl	-12(%rbp), %edx
	cmpl	%edx, %eax
	je .L4
# 6:
	jmp .L5
# 7:
	jmp .L6
# 8:res = t002 
.L4:
	movl	$1, -20(%rbp)
# 9:res = t003 arg1 = number2 arg2 = t002 
	movl	-12(%rbp), %eax
	movl	-20(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -24(%rbp)
# 10:res = number2 arg1 = t003 
	movl	-24(%rbp), %eax
	movl	%eax, -12(%rbp)
# 11:res = t004 arg1 = t003 
	movl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
# 12:
	jmp	.LRT0
# 13:res = t005 
.L5:
	movl	$1, -32(%rbp)
# 14:res = t006 arg1 = number1 arg2 = t005 
	movl	-4(%rbp), %eax
	movl	-32(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -36(%rbp)
# 15:res = number1 arg1 = t006 
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
# 16:res = t007 arg1 = t006 
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 17:
	jmp	.LRT0
# 18:
.L6:
	jmp .L3
# 19:res = t008 
.L2:
	movl	$2, -44(%rbp)
# 20:res = t009 arg1 = number2 arg2 = t008 
	movl	-12(%rbp), %eax
	movl	-44(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
# 21:res = number2 arg1 = t009 
	movl	-48(%rbp), %eax
	movl	%eax, -12(%rbp)
# 22:res = t010 arg1 = t009 
	movl	-48(%rbp), %eax
	movl	%eax, -52(%rbp)
# 23:
	jmp .L3
# 24:res = t011 
.L3:
	movl	$0, -56(%rbp)
# 25:res = t011 
	movl	-56(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-56, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
