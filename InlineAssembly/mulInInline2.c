  int a = 110 ;
  int b = 210;
  int result ;
int main()
{

  asm("pusha\n\t"
      "movl a, %eax\n\t"
          "movl b, %ebx\n\t"
          "mull %ebx\n\t"
      "movl %eax, result\n\t"
      "popa");
  /*result = a * b ;*/
  printf("Multiplication of %d and %d is %d", a,b, result);
}
