int main(int argc, char *argv[]){
	char buffer[80];
	if(argc < 2){
		printf(¡°argument error\n¡±);
		exit(-1);
	}
	strcpy(buffer, argv[1]);
	printf(¡°%s\n¡±, buffer);
}