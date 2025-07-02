INSTALL_DIR  ?= /opt/toolchains/m68k-elf
DL_MIRROR    ?= https://tenshi.skychase.zone/

GCC_DEFAULT_VER      := 15.1.0
BINUTILS_DEFAULT_VER := 2.44
NEWLIB_DEFAULT_VER   := 4.2.0

GCC_VER      ?= $(GCC_DEFAULT_VER)
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

# SHA-256 Sums
BINUTILS_2_35_SHA  := 1b11659fb49e20e18db460d44485f09442c8c56d5df165de9461eb09c8302f85
BINUTILS_2_35_1_SHA:= 3ced91db9bf01182b7e420eab68039f2083aed0a214c0424e257eae3ddee8607
BINUTILS_2_35_2_SHA:= dcd5b0416e7b0a9b24bed76cd8c6c132526805761863150a26d016415b8bdc7b
BINUTILS_2_36_SHA  := 5788292cc5bbcca0848545af05986f6b17058b105be59e99ba7d0f9eb5336fb8
BINUTILS_2_36_1_SHA:= e81d9edf373f193af428a0f256674aea62a9d74dfe93f65192d4eae030b0f3b0
BINUTILS_2_37_SHA  := 820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c
BINUTILS_2_38_SHA  := e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024
BINUTILS_2_39_SHA  := 645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00
BINUTILS_2_40_SHA  := 0f8a4c272d7f17f369ded10a4aca28b8e304828e95526da482b0ccc4dfc9d8e1
BINUTILS_2_41_SHA  := ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450
BINUTILS_2_42_SHA  := f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800
BINUTILS_2_43_SHA  := B53606F443AC8F01D1D5FC9C39497F2AF322D99E14CEA5C0B4B124D630379365
BINUTILS_2_43_1_SHA:= 13f74202a3c4c51118b797a39ea4200d3f6cfbe224da6d1d95bb938480132dfd
BINUTILS_2_44_SHA  := ce2017e059d63e67ddb9240e9d4ec49c2893605035cd60e92ad53177f4377237
GCC_6_5_SHA        := 7ef1796ce497e89479183702635b14bb7a46b53249209a5e0f999bebf4740945
GCC_7_5_SHA        := b81946e7f01f90528a1f7352ab08cc602b9ccc05d4e44da4bd501c5a189ee661
GCC_8_5_SHA        := d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50
GCC_9_5_SHA        := 27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f
GCC_10_5_SHA       := 25109543fdf46f397c347b5d8b7a2c7e5694a5a51cce4b9c6e1ea8a71ca307c1
GCC_11_5_SHA       := a6e21868ead545cf87f0c01f84276e4b5281d672098591c1c896241f09363478
GCC_12_1_SHA       := 62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b
GCC_12_2_SHA       := e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff
GCC_12_3_SHA       := 949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b
GCC_12_4_SHA       := 704f652604ccbccb14bdabf3478c9511c89788b12cb3bbffded37341916a9175
GCC_13_1_SHA       := 61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492286c4dfc13ee86
GCC_13_2_SHA       := e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da
GCC_13_3_SHA       := 0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083
GCC_13_4_SHA       := 9c4ce6dbb040568fdc545588ac03c5cbc95a8dbf0c7aa490170843afb59ca8f5
GCC_14_1_SHA       := e283c654987afe3de9d8080bc0bd79534b5ca0d681a73a11ff2b5d3767426840
GCC_14_2_SHA       := a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9
GCC_14_3_SHA       := e0dc77297625631ac8e50fa92fffefe899a4eb702592da5c32ef04e2293aca3a
GCC_15_1_SHA       := e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea
NEWLIB_1_20_SHA    := c644b2847244278c57bec2ddda69d8fab5a7c767f3b9af69aa7aa3da823ff692
NEWLIB_2_5_SHA     := d2bf5d0f375381a9e6888e3074ac0e4cae72a7a748a05ef24f81b8df5328ef31
NEWLIB_3_2_SHA     := f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4
NEWLIB_4_0_SHA     := 71ffb00979ce978216debb2b037dc8b1b3d780ebc2e0fa0e2757188704291052
NEWLIB_4_1_SHA     := f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154
NEWLIB_4_2_SHA     := c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435
NEWLIB_4_3_SHA     := 83a62a99af59e38eb9b0c58ed092ee24d700fff43a22c03e433955113ef35150
NEWLIB_4_4_SHA     := 0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13
NEWLIB_4_5_SHA     := 33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852
# NOTE: Newlib 4.4.0.20231231 : Compilation fails (for 68k)
# libgloss/m68k/../read.c:24:1: error: conflicting types for ‘read’; have ‘int(int,  void *, size_t)’

# Grab the right GCC hash, and while we're at it try to determine the correct versions
# of binutils and newlib if unspecified, to avoid compatibility issues
ifeq ($(GCC_VER),15.1.0)
  GCC_SHA = $(GCC_15_1_SHA)
else ifeq ($(GCC_VER),14.3.0)
  GCC_SHA = $(GCC_14_3_SHA)
else ifeq ($(GCC_VER),14.2.0)
  GCC_SHA = $(GCC_14_2_SHA)
else ifeq ($(GCC_VER),14.1.0)
  GCC_SHA = $(GCC_14_1_SHA)
else ifeq ($(GCC_VER),13.4.0)
  GCC_SHA = $(GCC_13_4_SHA)
else ifeq ($(GCC_VER),13.3.0)
  GCC_SHA = $(GCC_13_3_SHA)
else ifeq ($(GCC_VER),13.2.0)
  GCC_SHA = $(GCC_13_2_SHA)
else ifeq ($(GCC_VER),13.1.0)
  GCC_SHA = $(GCC_13_1_SHA)
else ifeq ($(GCC_VER),12.4.0)
  GCC_SHA = $(GCC_12_4_SHA)
else ifeq ($(GCC_VER),12.3.0)
  GCC_SHA = $(GCC_12_3_SHA)
else ifeq ($(GCC_VER),12.2.0)
  GCC_SHA = $(GCC_12_2_SHA)
else ifeq ($(GCC_VER),12.1.0)
  GCC_SHA = $(GCC_12_1_SHA)
else ifeq ($(GCC_VER),11.5.0)
  GCC_SHA = $(GCC_11_5_SHA)
else ifeq ($(GCC_VER),10.5.0)
  GCC_SHA = $(GCC_10_5_SHA)
else ifeq ($(GCC_VER),9.5.0)
  NEWLIB_VER ?= 3.2.0
  GCC_SHA = $(GCC_9_5_SHA)
else ifeq ($(GCC_VER),8.5.0)
  NEWLIB_VER ?= 3.2.0
  GCC_SHA = $(GCC_8_5_SHA)
else ifeq ($(GCC_VER),7.5.0)
  NEWLIB_VER ?= 3.2.0
  GCC_SHA = $(GCC_7_5_SHA)
else ifeq ($(GCC_VER),6.5.0)
  NEWLIB_VER ?= 3.2.0
  GCC_SHA = $(GCC_6_5_SHA)
else
  $(error Unsupported GCC version)
endif

# If either of these are still unspecified, assign them now
BINUTILS_VER ?= $(BINUTILS_DEFAULT_VER)
NEWLIB_VER   ?= $(NEWLIB_DEFAULT_VER)

# Get the right Binutils hash
ifeq ($(BINUTILS_VER),2.44)
  BINUTILS_SHA = $(BINUTILS_2_44_SHA)
else ifeq ($(BINUTILS_VER),2.43.1)
  BINUTILS_SHA = $(BINUTILS_2_43_1_SHA)
else ifeq ($(BINUTILS_VER),2.43)
  BINUTILS_SHA = $(BINUTILS_2_43_SHA)
else ifeq ($(BINUTILS_VER),2.42)
  BINUTILS_SHA = $(BINUTILS_2_42_SHA)
else ifeq ($(BINUTILS_VER),2.41)
  BINUTILS_SHA = $(BINUTILS_2_41_SHA)
else ifeq ($(BINUTILS_VER),2.40)
  BINUTILS_SHA = $(BINUTILS_2_40_SHA)
else ifeq ($(BINUTILS_VER),2.39)
  BINUTILS_SHA = $(BINUTILS_2_39_SHA)
else ifeq ($(BINUTILS_VER),2.38)
  BINUTILS_SHA = $(BINUTILS_2_38_SHA)
else ifeq ($(BINUTILS_VER),2.37)
  BINUTILS_SHA = $(BINUTILS_2_37_SHA)
else ifeq ($(BINUTILS_VER),2.36.1)
  BINUTILS_SHA = $(BINUTILS_2_36_1_SHA)
else ifeq ($(BINUTILS_VER),2.36)
  BINUTILS_SHA = $(BINUTILS_2_36_SHA)
else ifeq ($(BINUTILS_VER),2.35.2)
  BINUTILS_SHA = $(BINUTILS_2_35_2_SHA)
else ifeq ($(BINUTILS_VER),2.35.1)
  BINUTILS_SHA = $(BINUTILS_2_35_1_SHA)
else ifeq ($(BINUTILS_VER),2.35)
  BINUTILS_SHA = $(BINUTILS_2_35_SHA)
else
  $(error Unsupported Binutils version)
endif

# Correct Newlib version without date
ifeq ($(NEWLIB_VER),4.5.0)
  NEWLIB_VER = 4.5.0.20241231
else ifeq ($(NEWLIB_VER),4.4.0)
  NEWLIB_VER = 4.4.0.20231231
else ifeq ($(NEWLIB_VER),4.3.0)
  NEWLIB_VER = 4.3.0.20220120
else ifeq ($(NEWLIB_VER),4.2.0)
  NEWLIB_VER = 4.2.0.20211231
else ifeq ($(NEWLIB_VER),2.5.0)
  NEWLIB_VER = 2.5.0.20171222
endif

# Get the right Newlib hash
ifeq ($(NEWLIB_VER),4.5.0.20241231)
  NEWLIB_SHA = $(NEWLIB_4_5_SHA)
else ifeq ($(NEWLIB_VER),4.4.0.20231231)
  NEWLIB_SHA = $(NEWLIB_4_4_SHA)
else ifeq ($(NEWLIB_VER),4.3.0.20230122)
  NEWLIB_SHA = $(NEWLIB_4_3_SHA)
else ifeq ($(NEWLIB_VER),4.2.0.20211231)
  NEWLIB_SHA = $(NEWLIB_4_2_SHA)
else ifeq ($(NEWLIB_VER),4.1.0)
  NEWLIB_SHA = $(NEWLIB_4_1_SHA)
else ifeq ($(NEWLIB_VER),4.0.0)
  NEWLIB_SHA = $(NEWLIB_4_0_SHA)
else ifeq ($(NEWLIB_VER),3.2.0)
  NEWLIB_SHA = $(NEWLIB_3_2_SHA)
else ifeq ($(NEWLIB_VER),2.5.0.20171222)
  NEWLIB_SHA = $(NEWLIB_2_5_SHA)
else ifeq ($(NEWLIB_VER),1.20.0)
  NEWLIB_SHA = $(NEWLIB_1_20_SHA)
else
  $(error Unsupported Newlib version)
endif

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
#  NPROC := $(shell sysctl -n hw.logicalcpu)
  SEDI := -i '.bak'
else
#  NPROC := $(shell nproc)
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
mk-binutils: | $(BINUTILS_DIR)
	@echo "+++ Building $(BINUTILS_DIR)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) --enable-install-libbfd \
		--enable-shared=no --disable-werror > $(LOGDIR)/binutils.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all >> $(LOGDIR)/binutils.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install-strip >> $(LOGDIR)/binutils.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-binutils

mk-gcc: BUILD_DIR=$(GCC_DIR)/build
mk-gcc: | $(GCC_DIR) $(GCC_PREREQ) mk-binutils
	@echo "+++ Building $(GCC_DIR)..."
	#cd $(GCC_DIR) && ./contrib/download_prerequisites > $(LOGDIR)/gcc.log 2>&1
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--enable-languages=$(LANGS1P) --without-headers --disable-libssp \
		--disable-threads --disable-tls --disable-multilib --enable-shared=no \
		--disable-werror >> $(LOGDIR)/gcc.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all >> $(LOGDIR)/gcc.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install-strip >> $(LOGDIR)/gcc.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-gcc

mk-newlib: BUILD_DIR=$(NEWLIB_DIR)/build
mk-newlib: | $(NEWLIB_DIR) mk-gcc
	@echo "+++ Building $(NEWLIB_DIR)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--disable-multilib --disable-werror > $(LOGDIR)/newlib.log 2>&1
	sed $(SEDI) 's/^CFLAGS_FOR_TARGET =/CFLAGS_FOR_TARGET = -fpermissive/g' $(BUILD_DIR)/Makefile
	$(MAKE) -C $(BUILD_DIR) all >> $(LOGDIR)/newlib.log 2>&1
	$(MAKE) -C $(BUILD_DIR) install  >> $(LOGDIR)/newlib.log 2>&1
	@rm -rf $(BUILD_DIR)
	@touch mk-newlib

mk-gcc2: BUILD_DIR=$(GCC_DIR)/build
mk-gcc2: | $(GCC_DIR) mk-newlib
	@echo "+++ Building $(GCC_DIR) (Pass 2)..."
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ../configure $(COMFLAGS) \
		--enable-languages=$(LANGS) --without-headers --with-newlib \
		--disable-hosted-libstdxx --disable-libssp --disable-threads \
		--disable-tls --disable-multilib --enable-shared=no --disable-werror \
		> $(LOGDIR)/gcc2.log 2>&1
	$(MAKE) -C $(BUILD_DIR) all >> $(LOGDIR)/gcc2.log 2>&1
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

$(BINUTILS_DIR): | $(BINUTILS_PKG)
	tar xf $(BINUTILS_PKG)

$(GCC_DIR): | $(GCC_PKG)
	tar xf $(GCC_PKG)

$(NEWLIB_DIR): | $(NEWLIB_PKG)
	tar xf $(NEWLIB_PKG)

# Handling of GCC prerequisites

$(GCC_DIR)/isl: $(ISL_PKG) | $(GCC_DIR)
	tar xf $< && mv $(ISL_DIR) $@

$(GCC_DIR)/gmp: $(GMP_PKG) | $(GCC_DIR)
	tar xf $< && mv $(GMP_DIR) $@

$(GCC_DIR)/mpc: $(MPC_PKG) | $(GCC_DIR)
	tar xf $< && mv $(MPC_DIR) $@

$(GCC_DIR)/mpfr: $(MPFR_PKG) | $(GCC_DIR)
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
