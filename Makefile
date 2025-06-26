INSTALL_DIR  ?= /opt/toolchains/m68k-elf
DL_MIRROR    ?= https://tenshi.skychase.zone/

BINUTILS_VER ?= 2.44
GCC_VER      ?= 15.1.0
NEWLIB_VER   ?= 4.2.0.20211231
ISL_VER      ?= 0.24
GMP_VER      ?= 6.2.1
MPC_VER      ?= 1.2.1
MPFR_VER     ?= 4.1.0

BINUTILS_DIR  = binutils-$(BINUTILS_VER)
GCC_DIR       = gcc-$(GCC_VER)
NEWLIB_DIR    = newlib-$(NEWLIB_VER)
ISL_DIR       = isl-$(ISL_VER)
GMP_DIR       = gmp-$(GMP_VER)
MPC_DIR       = mpc-$(MPC_VER)
MPFR_DIR      = mpfr-$(MPFR_VER)

BINUTILS_PKG  = $(BINUTILS_DIR).tar.xz
GCC_PKG       = $(GCC_DIR).tar.xz
NEWLIB_PKG    = $(NEWLIB_DIR).tar.gz
ISL_PKG       = $(ISL_DIR).tar.bz2
GMP_PKG       = $(GMP_DIR).tar.xz
MPC_PKG       = $(MPC_DIR).tar.gz
MPFR_PKG      = $(MPFR_DIR).tar.xz

# Binutils 2.39, GCC 12.2.0
#BINUTILS_SHA  = 645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00
#GCC_SHA       = e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff

# For GCC 13.1.0
#GCC_SHA       = 61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492286c4dfc13ee86

# Binutils 2.40, GCC 13.2.0
#BINUTILS_SHA  = 0f8a4c272d7f17f369ded10a4aca28b8e304828e95526da482b0ccc4dfc9d8e1
#GCC_SHA       = e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da

# Newlib 4.2.0.20211231
NEWLIB_SHA    = c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435

# Binutils 2.43, GCC 14.2.0
#BINUTILS_SHA  = B53606F443AC8F01D1D5FC9C39497F2AF322D99E14CEA5C0B4B124D630379365
#GCC_SHA       = A7B39BC69CBF9E25826C5A60AB26477001F7C08D85CEC04BC0E29CABED6F3CC9

# Binutils 2.44, GCC 15.1.0
BINUTILS_SHA  = ce2017e059d63e67ddb9240e9d4ec49c2893605035cd60e92ad53177f4377237
GCC_SHA       = e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea

# Newlib 4.4.0.20231231 : Compilation fails (for 68k)
# libgloss/m68k/../read.c:24:1: error: conflicting types for ‘read’; have ‘int(int,  void *, size_t)’
#NEWLIB_SHA    = 0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13

ISL_SHA       = fcf78dd9656c10eb8cf9fbd5f59a0b6b01386205fe1934b3b287a0a1898145c0
GMP_SHA       = fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2
MPC_SHA       = 17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459
MPFR_SHA      = 0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f

GCC_PREREQ  = $(GCC_DIR)/isl
GCC_PREREQ += $(GCC_DIR)/gmp
GCC_PREREQ += $(GCC_DIR)/mpc
GCC_PREREQ += $(GCC_DIR)/mpfr

# Detect the number of processors for a parallel make
# GNU sed forbids space after -i, BSD sed requires space after -i
ifeq ($(shell uname),Darwin)
	NPROC := $(shell sysctl -n hw.logicalcpu)
	SEDI := -i '.bak'
else
	NPROC := $(shell nproc)
	SEDI := -i'.bak'
endif

TARGET := m68k-elf
PREFIX := $(shell pwd)/work
PATH   := $(PREFIX)/bin:$(PATH)
LOGDIR := $(shell pwd)
SHASUM := shasum -a 256 -c
LANGS  ?= c,c++

COMFLAGS := --target=m68k-elf --with-cpu=m68000 --prefix=$(PREFIX) --libdir=$(PREFIX)/lib --libexecdir=$(PREFIX)/libexec

.PHONY: all without-newlib install clean

all: LANGS1P = c
all: mk-gcc2

without-newlib: LANGS1P = c
without-newlib: mk-gcc

install:
	@mkdir -p $(INSTALL_DIR)
	@cp -rf $(PREFIX)/* $(INSTALL_DIR)
	@echo "Toolchain installed to $(INSTALL_DIR)."
	@echo "Add $(INSTALL_DIR)/bin to your PATH before building projects."

mk-binutils: BUILD_DIR=$(BINUTILS_DIR)/build
mk-binutils: $(BINUTILS_DIR)
	@echo "+++ Building $(BINUTILS_DIR)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) --enable-install-libbfd \
		--enable-shared=no --disable-werror > $(LOGDIR)/binutils.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all -j$(NPROC) >> $(LOGDIR)/binutils.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install-strip >> $(LOGDIR)/binutils.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-binutils

mk-gcc: BUILD_DIR=$(GCC_DIR)/build
mk-gcc: $(GCC_DIR) $(GCC_PREREQ) mk-binutils
	@echo "+++ Building $(GCC_DIR)..."
	#cd $(GCC_DIR) && ./contrib/download_prerequisites > $(LOGDIR)/gcc.log 2>&1
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--enable-languages=$(LANGS1P) --without-headers --disable-libssp \
		--disable-threads --disable-tls --disable-multilib --enable-shared=no \
		--disable-werror >> $(LOGDIR)/gcc.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all -j$(NPROC) >> $(LOGDIR)/gcc.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install-strip >> $(LOGDIR)/gcc.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-gcc

mk-newlib: BUILD_DIR=$(NEWLIB_DIR)/build
mk-newlib: $(NEWLIB_DIR) mk-gcc
	@echo "+++ Building $(NEWLIB_DIR)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--disable-multilib --disable-werror > $(LOGDIR)/newlib.log 2>&1
	sed $(SEDI) 's/^CFLAGS_FOR_TARGET =/CFLAGS_FOR_TARGET = -fpermissive/g' $(BUILD_DIR)/Makefile
	$(MAKE) -C $(BUILD_DIR) all -j$(NPROC) >> $(LOGDIR)/newlib.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install  >> $(LOGDIR)/newlib.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-newlib

mk-gcc2: BUILD_DIR=$(GCC_DIR)/build
mk-gcc2: $(GCC_DIR) mk-newlib
	@echo "+++ Building $(GCC_DIR) (Pass 2)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--enable-languages=$(LANGS) --without-headers --with-newlib \
		--disable-hosted-libstdxx --disable-libssp --disable-threads \
		--disable-tls --disable-multilib --enable-shared=no --disable-werror \
		> $(LOGDIR)/gcc2.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all -j$(NPROC) >> $(LOGDIR)/gcc2.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install-strip >> $(LOGDIR)/gcc2.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-gcc2

# Download packages from mirror

$(BINUTILS_PKG):
	@wget $(DL_MIRROR)$(BINUTILS_PKG)
	@echo "$(BINUTILS_SHA) *$(BINUTILS_PKG)" | $(SHASUM)

$(GCC_PKG):
	@wget $(DL_MIRROR)$(GCC_PKG)
	@echo "$(GCC_SHA) *$(GCC_PKG)" | $(SHASUM)

$(NEWLIB_PKG):
	@wget $(DL_MIRROR)$(NEWLIB_PKG)
	@echo "$(NEWLIB_SHA) *$(NEWLIB_PKG)" | $(SHASUM)

# Extract source packages with tar

$(BINUTILS_DIR): $(BINUTILS_PKG)
	tar xf $(BINUTILS_PKG)

$(GCC_DIR): $(GCC_PKG)
	tar xf $(GCC_PKG)

$(NEWLIB_DIR): $(NEWLIB_PKG)
	tar xf $(NEWLIB_PKG)

# Handling of GCC prerequisites

$(GCC_DIR)/isl: $(ISL_PKG) $(GCC_DIR)
	tar xf $< && mv $(ISL_DIR) $@

$(GCC_DIR)/gmp: $(GMP_PKG) $(GCC_DIR)
	tar xf $< && mv $(GMP_DIR) $@

$(GCC_DIR)/mpc: $(MPC_PKG) $(GCC_DIR)
	tar xf $< && mv $(MPC_DIR) $@

$(GCC_DIR)/mpfr: $(MPFR_PKG) $(GCC_DIR)
	tar xf $< && mv $(MPFR_DIR) $@

$(ISL_PKG):
	@wget $(DL_MIRROR)$(ISL_PKG)
	@echo "$(ISL_SHA) *$(ISL_PKG)" | $(SHASUM)

$(GMP_PKG):
	@wget $(DL_MIRROR)$(GMP_PKG)
	@echo "$(GMP_SHA) *$(GMP_PKG)" | $(SHASUM)

$(MPC_PKG):
	@wget $(DL_MIRROR)$(MPC_PKG)
	@echo "$(MPC_SHA) *$(MPC_PKG)" | $(SHASUM)

$(MPFR_PKG):
	@wget $(DL_MIRROR)$(MPFR_PKG)
	@echo "$(MPFR_SHA) *$(MPFR_PKG)" | $(SHASUM)


clean:
	rm -rf work
	rm -rf $(BINUTILS_DIR)
	rm -rf $(GCC_DIR)
	rm -rf $(NEWLIB_DIR)
	rm -f mk-binutils mk-gcc mk-newlib mk-gcc2
