#!/bin/bash

export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s

# make -j16 clean
# make -j16 mrproper

make ARCH=arm64 exynos9820-d2xks_defconfig
make ARCH=arm64 -j16 || exit 1

IMAGE="arch/arm64/boot/Image"
LOCATION=$(pwd)
AIK_DIR="AIK"
OUT_DIR="out"

if [ -d "$OUT_DIR" ]; then
    rm -rf "$OUT_DIR"/*
else
    mkdir -p "$OUT_DIR"
fi

# Make boot.img file
cp "$IMAGE" "$AIK_DIR/split_img/boot.img-kernel"

cd "$AIK_DIR"
./repackimg.sh

cd "$LOCATION"
mv "$AIK_DIR/image-new.img" "$OUT_DIR/boot.img"

# Make dt.img file
cd "$LOCATION"
	python3 mkdtboimg.py create dt.img \
  	--page_size=2048 \
  	--version=0 \
  	--id=0x0 --rev=0x0 --custom0=0x0 --custom1=0x0 --custom2=0x0 --custom3=0x0 \
  	arch/arm64/boot/dts/exynos/exynos9825.dtb --custom0=0x00 --custom1=0xff --id=0x0 --rev=0x0 
mv "dt.img" "$OUT_DIR/dt.img"

# Make dtbo.img file
cd "$LOCATION"
        python3 mkdtboimg.py create dtbo.img \
  	--page_size=2048 \
  	--version=0 \
  	--id=0x0 --rev=0x0 --custom0=0x0 --custom1=0x0 --custom2=0x0 --custom3=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_02.dtbo --custom0=0x02 --custom1=0x0f --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_16.dtbo --custom0=0x10 --custom1=0x10 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_17.dtbo --custom0=0x11 --custom1=0x11 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_18.dtbo --custom0=0x12 --custom1=0x12 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_19.dtbo --custom0=0x13 --custom1=0x14 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_21.dtbo --custom0=0x15 --custom1=0x15 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_22.dtbo --custom0=0x16 --custom1=0x16 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_23.dtbo --custom0=0x17 --custom1=0x17 --id=0x0 --rev=0x0 \
  	arch/arm64/boot/dts/samsung/exynos9820-d2x_kor_24.dtbo --custom0=0x18 --custom1=0xff --id=0x0 --rev=0x0

mv "dtbo.img" "$OUT_DIR/dtbo.img"

# Make tar_file
cd $OUT_DIR
tar -cvf N976N_Ramdisk.tar boot.img dt.img dtbo.img
