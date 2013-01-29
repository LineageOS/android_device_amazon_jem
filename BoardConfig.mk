DEVICE_FOLDER := device/amazon/jem

# inherit from common
-include device/amazon/bowser-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/amazon/jem/BoardConfigVendor.mk

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/bowser-common
TARGET_KERNEL_CONFIG := jem_android_defconfig

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk

# hack the ota
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./$(DEVICE_FOLDER)/releasetools/bowser_ota_from_target_files
# not tested at all
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./$(DEVICE_FOLDER)/releasetools/bowser_img_from_target_files

# TWRP Config
TARGET_OTA_ASSERT_DEVICE := blaze_tablet,bowser,jem
DEVICE_RESOLUTION := 1920x1200
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_X := true
