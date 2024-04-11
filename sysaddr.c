#include <dlfcn.h>
int main(){
	long addr;
	void *handle;
	handle = dlopen(¡°/lib/libc.so.6¡±, RTLD_LAZY); 
	addr = (long)dlsym(handle, ¡°system¡±);
	printf(¡°%x\n¡±, addr);
}