I got myself a 5070 Ti for Christmas.
On Debian 13 I got nvidia's open-source drivers installed.
I did `apt-get install cuda-toolkit`.
Let's see what we can do!

Here is a tutorial:

https://cuda-tutorial.readthedocs.io/en/latest/tutorials/tutorial01/

Actually that seems to follow this blog post: https://developer.nvidia.com/blog/even-easier-introduction-cuda/
But I like the first link because it's C not C++.
But the `nsys_easy` script is nice to know about.

You will need nvcc, so do `source env.sh`.

Then `make && ./hello`

To get stats:

```
nsys nvprof ./vector_add2
nsys nvprof --print-gpu-trace ./vector_add2
```

So it's interesting that there is no special pattern-recognition to transform my `for` loop into vectorized instructions.
I'm just running compiled C code, but it's spread out across tons of threads.

So what part is CUDA? I guess `cudaMalloc`/`cudaFree`/`cudaMemcpy` and also `threadIdx`/`blockIdx`/`blockDim`/`gridDim`. And nvcc.
What do the machine instructions look like? Can nvcc output asm? Object files?
