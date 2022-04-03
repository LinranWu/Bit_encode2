/*BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE UNIVERSITY ACADEMIC INTEGRITY POLICY WITH RESPECT TO THIS ASSIGNMENT. */
/*student name: Linran Wu*/

#include <stdio.h>

unsigned int create_key();
unsigned char rotate_right(unsigned char);
unsigned char rotate_left(unsigned char);
unsigned int get_string(unsigned char* d_ptr);
int formattedprint(unsigned char* d_ptr, unsigned int length);
int cipher(unsigned char* d_ptr, unsigned int key, unsigned int length);

/*This program is a bit message stream cipher that is an encryption algorithm that encrypts 1 byte of plain text at a time.*/
int main(){

	unsigned char text[201];	/*this is where to store the text string*/
	unsigned int key,length;
	/*get input value of text and put its length to variable length*/	
	length = get_string(text);
	/*print what was the input from keyboard and its hex value*/
	printf("\n%s\n\nhex encoding:",text);
	formattedprint(text,length);
	/*create key from 4-digit of key input*/
	key = create_key();
	/*cipher the char array as desired*/
	cipher(text,key,length);
	/*print the hex value of ciphered char array*/
	printf("\nhex cipthertext: ");
	formattedprint(text,length);

	return 0;
}


/*passed a character array, cipher the character array using xor that value with a keyy and proper rotaion*/
int cipher(unsigned char* d_ptr, unsigned int key,unsigned int length)
{
	int i=0; /*counter*/
	for(;i<length;i++)	/*cipher each char in the char array*/
	{
		*(d_ptr+i) = *(d_ptr+i) ^ key;
		/*rotate left odd # of values and rotate right even # of values*/
		if((i % 2) == 0)
		{
			*(d_ptr+i)=rotate_left(*(d_ptr+i));
		}else
		{
			*(d_ptr+i)=rotate_right(*(d_ptr+i));
		}
		
	}
	return 0;
}

/*given a character array, print it on the screen in its hexdecimal value with the format of ten value per trow*/
int formattedprint(unsigned char* d_ptr,unsigned int length)
{
	int i=0;		/*counter*/
	do	/*print an array of characters with formatted spacing*/
	{	/*print 10 values then column*/
		if((i % 10) == 0)
		{
			printf("\n\n\t");
		}
		printf("%02x ",*(d_ptr+i));
		i++;
	}while(i<length);
	printf("\n");
	return 0;
}

/*passed a single depointer of a character array, read in value from keyboard and put in the array, and return the length of the string*/
unsigned int get_string(unsigned char* d_ptr)
{
	int c,i = 0;	/*c being charactor got from getchar, i is a counter*/
	printf("\nenter cleartext: ");		/*prompt to enter text*/
	while((c=getchar()) != '\n')		/*store each char to the char array*/
	{
		*(d_ptr+i++) = c;
	}
	*(d_ptr+i)='\0';		/*terminate the string*/
	return i;
}

