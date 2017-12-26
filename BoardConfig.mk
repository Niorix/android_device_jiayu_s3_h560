# mt6752 platform boardconfig
LOCAL_PATH := device/jiayu/s3_h560

include vendor/mad/config/board.mk

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6752
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true

TARGET_BOOTLOADER_BOARD_NAME := mt6752

# Ashmem
DISABLE_ASHMEM_TRACKING := true
BOARD_USES_MTK_HARDWARE := true
BOARD_MTK_HARDWARE := true
# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
# CyanogenMod Hardware Hooks
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.selinux=disabled
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00e88000 --tags_offset 0x0df88000 --board 1450352440
TARGET_KERNEL_SOURCE := kernel/jiayu/s3_h560
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := h560_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu/bin
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

TARGET_USES_EARLY_SUSPEND := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
# Use mke2fs instead of make_ext4fs
TARGET_USES_MKE2FS := true

# Include needed symbols
TARGET_INCLUDE_XLOG_SYMBOLS := true
TARGET_INCLUDE_AUDIO_SYMBOLS := true
TARGET_INCLUDE_UI_SYMBOLS := true
TARGET_INCLUDE_OMX_SYMBOLS := true
TARGET_INCLUDE_GPS_SYMBOLS := true

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
#BOARD_USES_LEGACY_MTK_AV_BLOB := true
#BOARD_USES_MTK_MEDIA_PROFILES:=true
TARGET_HAS_LEGACY_LP_CAM := true
USE_CAMERA_STUB := true
# Power and native tap-to-wake
TARGET_POWERHAL_VARIANT := mtk-xen0n

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING:=true

# Extended Filesystem Support
TARGET_KERNEL_HAVE_EXFAT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_MEDIATEK_USES_GPS:=true
# LightHAL
TARGET_PROVIDES_LIBLIGHT := true
BOARD_GPS_LIBRARIES:=true
#ril
BOARD_RIL_CLASS := ../../../device/jiayu/s3_h560/ril
BOARD_CONNECTIVITY_MODULE := conn_soc

SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)

#dt2w
TARGET_TAP_TO_WAKE_NODE := /sys/devices/bus.2/11007000.I2C0/i2c-0/0-0020/gesture

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
BOARD_NO_SECURE_DISCARD := true # secure discard is painfully slow...
# TWRP-specific
ifeq ($(RECOVERY_VARIANT), twrp)
DEVICE_RESOLUTION := 1080x1920
DEVICE_SCREEN_WIDTH := 1080
DEVICE_SCREEN_HEIGHT := 1920
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
endif

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true
#dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy
WITH_ROOT_METHOD = magisk
# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp
