#include <stdio.h>
#include <stdlib.h>

#define N 10000000

__global__ void vector_add(float *out, float *a, float *b, int n) {
    for (int i = 0; i < n; i++) {
        out[i] = a[i] + b[i];
    }
}

int main() {
    float *a, *b, *out;
    float *cudaA, *cudaB, *cudaOut;

    a = (float *)malloc(sizeof(float) * N);
    b = (float *)malloc(sizeof(float) * N);
    out = (float *)malloc(sizeof(float) * N);

    for (int i = 0; i < N; i++) {
        a[i] = 1.0f;
        b[i] = 2.0f;
    }

    cudaMalloc(&cudaA, sizeof(float) * N);
    cudaMalloc(&cudaB, sizeof(float) * N);
    cudaMalloc(&cudaOut, sizeof(float) * N);

    cudaMemcpy(cudaA, a, sizeof(float) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(cudaB, b, sizeof(float) * N, cudaMemcpyHostToDevice);
    vector_add<<<1,1>>>(cudaOut, cudaA, cudaB, N);
    cudaMemcpy(out, cudaOut, sizeof(float) * N, cudaMemcpyDeviceToHost);

    int one_tenth = N / 10;
    for (int i = 0; i < N; i += one_tenth) {
      printf("out[%d] = %f\n", i, out[i]);
    }
}
