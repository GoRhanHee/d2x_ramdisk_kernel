# ✅ Galaxy Note10+ 5G Kernel Source (Include RAMDISK)

* 🇰🇷 Galaxy Note10+ 5G Kernel Source (South Korea Version)
* ⚠️ This kernel is Stock One-UI(4.1) Source (I recommend use Stock-rom // But if you want to use Custom-rom, Fork this kernel // This kernel source is Open source)
* 🪬 **RKP/KDP and Defex/Proca/UH Removed** 
* 📝 **overlay_fs defconfig Enabled** (Required KernelSU Compile)

# 💾 Include ""RAMDISK"" in Kernel 
* This Kernel Include RAMDISK
* **After Reboot, Magisk Remains** (Because, this kernel has RAMDISK)
* Dont Need TWRP // Only flash this kernel in Odin

# ⚙️ Available Root Methods 
* Magisk ✅ (Dont Need Recovery Boot)
* APatch ✅
* KernelSU-Next + SUSFS : [Click](https://github.com/GoRhanHee/exynos9820_SUSFS_kernel/releases/tag/KSUN_SUSFS)


# ❓ How to Compille? 

* **Local LINUX PC**
* **Prepare GCC & Clang Compiler** : [Download](https://github.com/CruelKernel/samsung-exynos9820-toolchain.git) (I recommend make "toolchain" folder (mkdir), and download compiler in this folder)
* Open terminal
*         ./build_kernel.sh
* **If you Compile Success, You can get boot.img | dt.img | dtbo.img and Odin_flashable file in "out" folder**


# 📋 Credit
* Samsung Open Source Project : [Click](https://opensource.samsung.com/main)
* Kernel Source Fix : [CruelKernel](https://github.com/CruelKernel/samsung-exynos9820) [ravindu644](https://github.com/ravindu644/samsung_exynos9820_stock)
* Idea : [LPOS_Kernel](https://github.com/ravindu644/android_kernel_samsung_sm_n975) [LineageOS_Kernel](https://github.com/LineageOS/android_kernel_samsung_exynos9820)
