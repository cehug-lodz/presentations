hello.o: hello.c
	clang -O2 -emit-llvm -c hello.c -o - | llc -march=bpf -filetype=obj -o hello.o

clean:
	rm -f hello.o
