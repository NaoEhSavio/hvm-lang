# Bend

Bend is a massively parallel, high-level programming language. Unlike existing
alternatives like CUDA, OpenCL and Metal, which are low-level and limited, Bend
has the feel and features of a modern language like Python and Haskell. Yet, it
runs with 1000's of cores, on CPUs and GPUs, powered by the
[HVM2](https://github.com/HigherOrderCO/hvm2).

## Using Bend

First, install [Rust nightly](https://www.oreilly.com/library/view/rust-programming-by/9781788390637/e07dc768-de29-482e-804b-0274b4bef418.xhtml). Then, install both HVM2 and Bend with:

```sh
cargo install hvm
cargo install bend-lang
```

Then, just write a Bend file, and run it with:

```sh
bend run    <file.hvm> # uses the Rust interpreter (sequential)
bend run-c  <file.hvm> # uses the C interpreter (parallel)
bend run-cu <file.hvm> # uses the CUDA interpreter (massively parallel)
```

You can also compile `Bend` to standalone C/CUDA files with `gen-c` and
`gen-cu`, for maximum possible performance.

## Parallel Programming in Bend

To write parallel programs in Bend, all you have to do is... **nothing**. Other
than not making it *inherently sequential*! For example, the expression:

```python
(((1 + 2) + 3) + 4)
```

Can **not** run in parallel, inherently so, because `+4` depends on `+3` which
depends on `(1+2)`. But the following expression:

```python
((1 + 2) + (3 + 4))
```

Can run in parallel, and will, due to Bend's fundamental pledge:

> Everything that **can** run in parallel, **will** run in parallel.

For a more complete example, consider:

```python
def sum(depth, x):
  switch depth:
    case 0:
      return x
    case _:
      fst = sum(depth-1, x*2+0) # adds the fst half
      snd = sum(depth-1, x*2+1) # adds the snd half
      return fst + snd
    
def main:
  return sum(30, 0)
```

This code adds all numbers from 0 to 2^30, but, instead of a loop, we use a
recursive divide-and-conquer approach. Since this approach is *inherently
parallel*, the Bend executable will run in many cores. Here are some benchmarks:

- CPU, Apple M3 Max, 1 thread: **3.5 minutes**

- CPU, Apple M3 Max, 16 threads: **10.26 seconds**

- GPU, NVIDIA RTX 4090, 32k threads: **1.88 seconds**

That's a **111x speedup** by doing nothing. No thread spawning, no explicit
management of locks, mutexes. From shaders, to transformers, to Erlang-like
actor-based systems, every concurrent setup can be implemented on Bend with no
explicit annotations. Long-distance communication is performed by global
beta-reduction, and handled correctly and efficiently by the
[HVM2](https://github.com/HigherOrderCO/HVM2) runtime.

- For more in-depth information, check HVM's [paper](https://github.com/HigherOrderCO/HVM/raw/main/PAPER.pdf).

- To jump straight into action, check Bend's [GUIDE.md](https://github.com/HigherOrderCO/bend/blob/main/GUIDE.md).

- For an extensive list of features, check [FEATURES.md](https://github.com/HigherOrderCO/bend/blob/main/FEATURES.md).
