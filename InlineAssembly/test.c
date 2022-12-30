int main()
{
  printf("Welcome");
  asm("movl $1,%eax\n\t"
     "movl $0, %ebx\n\t"
     "int $0x80");
  return 0;
}
