#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE UNIVERSIT'S ACADEMIC INTEGRITY POLICY WITH RESPECT TO THIS ASSIGNMENT.
#student name: Linran Wu

#passed a single hexadecimal value and return to the calling function that value rotated 1 position right
.file "rotate_right.s"
# Assembler directives to allocate storage for static array
.section .rodata

.globl rotate_right
	.type rotate_right, @function 

.text
rotate_right:

	pushq %rbp              #save caller’s rbp
	movq %rsp,%rbp          #set function’s frame pointer

	movb $1,%sil		#set %rsi to 1
	movb %dil,%al
	SARb %al		#arithmetic right shift %al
		
	#determine if %dil ends with 1
	ANDb %dil,%sil		
	je else			#if %dil ends with 0, then no need to make the 8th bit be 1
	ORb $128,%al
else:
	leave
	ret                      #return to caller’s code at return address
.size rotate_right, .-rotate_right

