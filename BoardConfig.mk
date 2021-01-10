#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Device Path
DEVICE_PATH := device/amazon/tank

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt8127
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# CPU
TARGET_CPU_SMP := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HARDWARE_3D := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x4000000 --second_offset 0x00f00000 --tags_offset 0x00000100

# Kernel Source
TARGET_KERNEL_CONFIG := tank_defconfig
TARGET_KERNEL_SOURCE := kernel/amazon/mt8127

# MediaTek
BOARD_USES_MTK_HARDWARE := true

# OTA
TARGET_OTA_ASSERT_DEVICE := tank

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # mmcblk0p5 (16384*1024)
BOARD_CACHEIMAGE_PARTITION_SIZE := 262144000 # mmcblk0p12 (256000*1024)
BOARD_FLASH_BLOCK_SIZE := 4096 # blockdev --getbsz /dev/block/mmcblk0
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # mmcblk0p6 (16384*1024)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 901775360 # mmcblk0p11 (880640*1024)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6583598080 # mmcblk0p13 (6429295*1024)

# Platform
TARGET_BOARD_PLATFORM := mt8127

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt8127

# Vendor
TARGET_COPY_OUT_VENDOR := system/vendor
