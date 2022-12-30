#include<stdio.h>
float Circumference(int r)
{
  return 2*r*3.14 ;
}
float Area(int r)
{
  return r * r * 3.14;
}
int main()
{
  int Radius  =5 ;
  printf("InputRadius Considered here is:  %d\n",Radius);
  printf("Calculated Circumference is : %f \n",Circumference(Radius));
  printf("Caculated Area is : %f\n", Area(Radius));
  return 0;
    }
  
