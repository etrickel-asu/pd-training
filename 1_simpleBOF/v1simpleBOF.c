#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void func(){
        int key=0x0c00l;
        char overflowme[16];
        printf("overflow me : ");
        gets(overflowme);       // smash me!
	printf("\nkey=%x\n", key);
        if(key == 0xcafebabe){
                system("/bin/sh");
        }
        else{
                printf("Nah..\n");
        }
}

int main(int argc, char* argv[]){
        func(0xdeadbeef);
        return 0;
}



