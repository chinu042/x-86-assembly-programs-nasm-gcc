section .data
	a dq 8.5
	b dq 71.5
	c dq 28.5
section .bss
	a1 resq 1
section .text
	global main
	extern printf
main:
	fld qword[a]	        ;;set st0 value to 10.5
	fldz		        ;;set st0 value to 0 and push in 10.5 in st1
        fld qword[b]       	;;put 11.5 in st0, 0 in st1 and 10.5 in st2
	fld1		        ;;put 1 in st0
	fldpi		        ;;put 3.145 in st0
	fsqrt		        ;;get square root of st0 and put it in st0
	fst qword[a]    	;;store st0 value in a
	fstp qword[b]   	;;store st0 value in b and pop st0 value
