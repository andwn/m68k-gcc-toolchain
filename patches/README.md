## Binutils

Currently just a single patch to defer the range check of a symbolic (d16,An)
displacement to the linker, so that this pattern:

    BASE+offset(a5)

can be used in gas when offset is extern/not yet known.

## GCC

The more notable ones.

#### 0001: `__attribute__((near))`

Enables GCC to generate (sym).w.

TODO: Proper documentation and example usage.

#### 0002: Fastcall

Fastcall ABI. d0-d2/a0-a1 are passed as parameters.

#### 0008: PR125728 fix/workaround

Fixes a codegen regression in GCC 16.x that may cause address errors on -O2.

## Newlib

`-mshort` is broken in Newlib. This patch on top of another in GCC attempts
to fix it, but there are probably more problems.
