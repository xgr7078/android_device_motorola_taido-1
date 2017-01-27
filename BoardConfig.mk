#
# Copyright (C) 2017 The CyanogenMod Project
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

DEVICE_PATH := device/motorola/taido
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

TARGET_BOARD_PLATFORM ?= mt6735m

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Common properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/fstab.mt6735

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_MTK_AUDIO := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/mt6735
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET := 0x00008000
TARGET_KERNEL_CONFIG := lineage_taido_defconfig

BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_CONNECTIVITY_MODULE := conn_soc

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
		WITH_DEXPREOPT ?= true
  endif
endif

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# GPS
ifeq ($(MTK_GPS_SUPPORT), yes)
    BOARD_GPS_LIBRARIES := true
else
    BOARD_GPS_LIBRARIES := false
endif

# Init
TARGET_INIT_VENDOR_LIB := libinit_taido

# Mediatek support
BOARD_USES_MTK_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=2558525440
BOARD_CACHEIMAGE_PARTITION_SIZE:=419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE:=4386701312

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# RIL
BOARD_RIL_CLASS := ../../../device/motorola/taido/ril

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Wireless
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Misc
EXTENDED_FONT_FOOTPRINT := true

TARGET_TAP_TO_WAKE_NODE := /sys/devices/soc/soc:touch/enable_gesture
