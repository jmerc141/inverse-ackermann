#include <stdio.h>
#include <stdlib.h>

unsigned long long int inv(int n){
    if(n<=4){
        return n;
    }

    unsigned long long int a=inv(n-1);
    unsigned long long int b=inv(n-2);

    return a+b;
}

int main(int argc, char *argv[]){
    if (argc==2){
        char *ptrn;
        unsigned long long int n=strtoull(argv[1], &ptrn, 10);
        unsigned long long int i=inv(n);
        printf("%llu\n", i);
    } else {
        printf("Need 1 argument");
    }
    return 0;
}
