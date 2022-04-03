#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE UNIVERSIT'S ACADEMIC INTEGRITY POLICY WITH RESPECT TO THIS ASSIGNMENT. 
#student name: Linran Wu

#This function reads in the 4 digits of the key and return the 8-bit key
.file "create_key.s" 
# Assembler directives to allocate storage for static array 
.section .rodata
printf_line:
.string "\nenter 4-bit key: "

.globl create_key
	.type create_key, @function

.text 
create_key:
	pushq %rbp		#save caller’s rbp
	movq %rsp,%rbp		#set function’s frame pointer

	#calling printf prompt to enter 4-bit key
	movq $printf_line, %rdi 
	movq $0, %rax 		# set %rax to 0 before calling printf
	call printf

	movl $0,%r8d		#initializing %r8 ready to store the 4-bit key
	movq $4,%rdi		#%rdi is a counter for the loop

#this loop reads in a 4-digit key
loop:
	decq %rdi
	jl exit

	SALl $1,%r8d

	#calling getchar
	pushq %r8 		#%r8,%rdi have values in them that our program needs
	pushq %rdi
	movq $0, %rax 		# set %rax to 0 before calling getchar
	call getchar
	popq %rdi
	popq %r8

	SUBl $0x30,%eax		#convert the ascii value in %eax to 0 or 1
	ORl %eax,%r8d
	jmp loop
exit:
	
	#convert 4-bit key to 8bit key
	movl $0,%eax
	ORl %r8d,%eax
	SALl $4,%eax
	ORl %r8d,%eax

	leave	
	ret			 #return to caller’s code at return address
.size create_key, .-create_key

