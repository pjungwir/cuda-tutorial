hello: hello.cu
	nvcc hello.cu -o hello

vector_add: vector_add.c
	nvcc $< -o $@

vector_add2: vector_add2.cu
	nvcc $< -o $@
