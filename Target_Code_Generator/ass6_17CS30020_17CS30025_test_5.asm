	.file	"output.s"

	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
# 0:res = t000 
	movl	$0, -12(%rbp)
# 1:res = t001 
	movl	$0, -20(%rbp)
# 2:res = t002 
	movl	$0, -24(%rbp)
# 3:res = t003 
	movl	$1, -28(%rbp)
# 4:res = i arg1 = t003 
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
# 5:res = t004 arg1 = t003 
	movl	-28(%rbp), %eax
	movl	%eax, -32(%rbp)
# 6:res = t005 
.L3:
	movl	$10, -36(%rbp)
# 7:arg1 = i arg2 = t005 
	movl	-4(%rbp), %eax
	movl	-36(%rbp), %edx
	cmpl	%edx, %eax
	jle .L1
# 8:
	jmp .L2
# 9:
	jmp .L2
# 10:res = t006 arg1 = i 
.L4:
	movl	-4(%rbp), %eax
	movl	%eax, -40(%rbp)
# 11:res = i arg1 = i 
	movl	-4(%rbp), %eax
	movl	$1, %edx
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
# 12:
	jmp .L3
# 13:res = t007 
.L1:
	movl	$1, -44(%rbp)
# 14:res = t008 arg1 = j arg2 = t007 
	movl	-8(%rbp), %eax
	movl	-44(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
# 15:res = j arg1 = t008 
	movl	-48(%rbp), %eax
	movl	%eax, -8(%rbp)
# 16:res = t009 arg1 = t008 
	movl	-48(%rbp), %eax
	movl	%eax, -52(%rbp)
# 17:res = j 
# 18:res = t010 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printInt
	movl	%eax, -56(%rbp)
	addq $0 , %rsp
# 19:
	jmp .L4
# 20:res = t011 
.L2:
	movl	$0, -60(%rbp)
# 21:arg1 = j arg2 = t011 
	movl	-8(%rbp), %eax
	movl	-60(%rbp), %edx
	cmpl	%edx, %eax
	jne .L5
# 22:
	jmp .L6
# 23:
	jmp .L6
# 24:res = t012 
.L5:
	movl	$1, -64(%rbp)
# 25:res = t013 arg1 = j arg2 = t012 
	movl	-8(%rbp), %eax
	movl	-64(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -68(%rbp)
# 26:res = j arg1 = t013 
	movl	-68(%rbp), %eax
	movl	%eax, -8(%rbp)
# 27:res = t014 arg1 = t013 
	movl	-68(%rbp), %eax
	movl	%eax, -72(%rbp)
# 28:res = j 
# 29:res = t015 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printInt
	movl	%eax, -76(%rbp)
	addq $0 , %rsp
# 30:
	jmp .L2
# 31:res = t016 
.L6:
	movl	$10, -80(%rbp)
# 32:res = i arg1 = t016 
	movl	-80(%rbp), %eax
	movl	%eax, -4(%rbp)
# 33:res = t017 arg1 = t016 
	movl	-80(%rbp), %eax
	movl	%eax, -84(%rbp)
# 34:res = t018 arg1 = i 
.L7:
	movl	-4(%rbp), %eax
	movl	%eax, -88(%rbp)
# 35:res = i arg1 = i 
	movl	-4(%rbp), %eax
	movl	$1, %edx
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
# 36:res = t019 
	movl	$1, -92(%rbp)
# 37:arg1 = i arg2 = t019 
	movl	-4(%rbp), %eax
	movl	-92(%rbp), %edx
	cmpl	%edx, %eax
	jg .L7
# 38:
	jmp .L8
# 39:
	jmp .L8
# 40:res = t020 
.L8:
	movl	$0, -96(%rbp)
# 41:res = t020 
	movl	-96(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-96, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
