I got myself a 5070 Ti for Christmas.
On Debian 13 I got nvidia's open-source drivers installed.
I did `apt-get install cuda-toolkit`.
Let's see what we can do!

Here is a tutorial:

https://cuda-tutorial.readthedocs.io/en/latest/tutorials/tutorial01/

You will need nvcc, so do `source env.sh`.

Then `make && ./hello`

To get stats:

```
nsys nvprof ./vector_add2
nsys nvprof --print-gpu-trace ./vector_add2
```
