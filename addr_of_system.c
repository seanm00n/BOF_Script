addr_of_system
#include <dlfcn.h>
int main(){
	long addr;
	void* handle;
	
	handle = dlopen("lib") ;
	addr = (long)dlsym(handle, "system");
	printf("system() is at 0x%x\n", addr);
}