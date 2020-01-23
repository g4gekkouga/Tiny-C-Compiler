	.file	"output.s"

	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$43, %rsp
# 0:res = t000 
	movl	$97, -10(%rbp)
# 1:res = c arg1 = t000 
	movzbl	-10(%rbp), %eax
	movb	%al, -9(%rbp)
# 2:res = t001 arg1 = t000 
	movzbl	-10(%rbp), %eax
	movb	%al, -11(%rbp)
# 3:res = t002 arg1 = i 
	leaq	-4(%rbp), %rax
	movq	%rax, -15(%rbp)
# 4:res = t002 
# 5:res = t003 
	pushq %rbp
	movq	-15(%rbp), %rdi
	call	readInt
	movl	%eax, -19(%rbp)
	addq $0 , %rsp
# 6:res = i 
# 7:res = t004 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	printInt
	movl	%eax, -23(%rbp)
	addq $0 , %rsp
# 8:res = t005 arg1 = f 
	leaq	-8(%rbp), %rax
	movq	%rax, -27(%rbp)
# 9:res = t005 
# 10:res = t006 
	pushq %rbp
	movq	-27(%rbp), %rdi
	call	readFlt
	movq	%rax, -35(%rbp)
	addq $0 , %rsp
# 11:res = f 
# 12:res = t007 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printFlt
	movq	%rax, -43(%rbp)
	addq $0 , %rsp
.LRT0:
	addq	$-43, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
