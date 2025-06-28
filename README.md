### GNU cross compiler toolchain for Motorola 68000 (m68k-elf)

To build & install:
 - `make`
 - `sudo make install`

Newlib is built by default. To disable it use `make without-newlib`.

The source packages are downloaded from a mirror and checksum'd because gnu.org was down while I made this.

### Changing Install Path

When installing, set the INSTALL DIR like this:

 - `sudo make install INSTALL_DIR=/opt/my/happy/place`

### Version Specification

By default, the latest known working versions of GCC, Binutils, and Newlib are built, but you can specify different versions of each like so:

 - `make GCC_VER=6.5.0 BINUTILS_VER=2.39 NEWLIB_VER=3.3.0`
 - `make GCC_VER=10.5.0`
 - `make without-newlib GCC_VER=13.4.0 BINUTILS_VER=2.43`

Note that you are not prevented from combining incompatible versions, so it is recommended to use `GCC_VER` by itself unless you need a specific version of the other two for testing.

### List of available versions

|Name     |Version |Release Date |Notes                        |
|---------|--------|-------------|-----------------------------|
|GCC      |15.1.0  |2025-04-25   |Current default              |
|GCC      |14.3.0  |2025-05-23   |                             |
|GCC      |14.2.0  |2024-08-01   |                             |
|GCC      |14.1.0  |2024-05-07   |                             |
|GCC      |13.4.0  |2025-06-05   |                             |
|GCC      |13.3.0  |2024-05-21   |                             |
|GCC      |13.2.0  |2023-07-27   |Used by SGDK 2.10+           |
|GCC      |13.1.0  |2023-04-26   |                             |
|GCC      |12.4.0  |2024-06-24   |                             |
|GCC      |12.3.0  |2023-05-08   |                             |
|GCC      |12.2.0  |2022-08-19   |                             |
|GCC      |12.1.0  |2022-05-06   |                             |
|GCC      |11.5.0  |2024-07-19   |                             |
|GCC      |10.5.0  |2023-07-07   |                             |
|GCC      |9.5.0   |2022-05-27   |                             |
|GCC      |8.5.0   |2021-05-14   |                             |
|GCC      |7.5.0   |2019-11-14   |                             |
|GCC      |6.5.0   |2018-10-30   |6.3 used by SGDK 1.30+       |
|Binutils |2.44    |2025-02-02   |Current default              |
|Binutils |2.43.1  |2024-08-17   |                             |
|Binutils |2.43    |2024-08-04   |                             |
|Binutils |2.42    |2024-01-29   |                             |
|Binutils |2.41    |2023-07-30   |                             |
|Binutils |2.40    |2023-01-16   |                             |
|Binutils |2.39    |2022-08-05   |                             |
|Binutils |2.38    |2022-02-09   |                             |
|Binutils |2.37    |2021-07-18   |                             |
|Binutils |2.36.1  |2021-02-06   |                             |
|Binutils |2.36    |2021-01-24   |                             |
|Binutils |2.35.2  |2021-01-30   |                             |
|Binutils |2.35.1  |2020-09-19   |                             |
|Binutils |2.35    |2020-07-24   |                             |
|Newlib   |4.5.0   |2024-12-31   |                             |
|Newlib   |4.4.0   |2023-12-31   |DOESN'T WORK!                |
|Newlib   |4.3.0   |2023-01-20   |                             |
|Newlib   |4.2.0   |2021-12-31   |Default for GCC >= 10        |
|Newlib   |4.1.0   |2020-12-18   |                             |
|Newlib   |4.0.0   |2020-11-17   |                             |
|Newlib   |3.3.0   |2020-01-22   |Default for GCC < 10         |
|Newlib   |2.5.0   |2017-12-22   |                             |
|Newlib   |1.20.0  |2011-12-19   |                             |

### zlib license

Copyright (c) 2025 andwn

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

