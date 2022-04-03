#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE UNIVERSIT'sACADEMIC INTEGRITY POLICY WITH RESPECT TO THIS ASSIGNMENT.
#student name: Linran Wu

#passed a single hexadecimal value and return to the calling function that value rotated 1 position left
.file "rotate_left.s"
# Assembler directives to allocate storage for static array
.section .rodata

.globl rotate_left
        .type rotate_left, @function

.text
rotate_left:

	pushq %rbp              #save caller’s rbp
	movq %rsp,%rbp          #set function’s frame pointer

	movb $128,%sil		#set %rsi to 128
	movb %dil,%al		
	SALb $1,%al		#left shift %al

	#determine if %dil starts with 1
	ANDb %dil,%sil		
	je else			#if %dil start with 0, then no need to make sure the last bit of %al to be 1
	ORb $1,%al

else:
	leave
	ret                      #return to caller’s code at return address
.size rotate_left, .-rotate_left

#i am aware of that the value in %dil would not start with 1 since it is an ascii value, but i just wish the function would be more robust so that i checked if it start with 1.

