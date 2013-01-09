#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_FOLDER := device/amazon/jem
COMMON_FOLDER := device/amazon/omap4-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.bowser \
    lights.bowser \
    power.bowser \
    camera.bowser \
    audio.primary.bowser \
    audio.hdmi.bowser \

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_bcmdhd \
    libnetcmdiface

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    brcm_patchram_plus

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/init.bowser.rc:root/init.bowser.rc \
    $(DEVICE_FOLDER)/root/init.bowser.usb.rc:root/init.bowser.usb.rc \
    $(DEVICE_FOLDER)/root/ueventd.bowser.rc:root/ueventd.bowser.rc \

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/battery_log.sh:/system/bin/battery_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/cond_start_ril:/system/bin/cond_start_ril \
    $(DEVICE_FOLDER)/prebuilt/bin/emmc_init.sh:/system/bin/emmc_init.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/temperature_log.sh:/system/bin/temperature_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/thermal_setup.sh:/system/bin/thermal_setup.sh \

# Remove ducati for now until I fix ducati load crash
# Prebuilt firmware
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/wifi/firmware/firmware-jem.bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(COMMON_FOLDER)/wifi/firmware/firmware-jem.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    $(COMMON_FOLDER)/wifi/firmware/firmware-jem.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin \
    $(DEVICE_FOLDER)/firmware/smc_pa.ift:/system/vendor/firmware/smc_pa.ift \
    $(DEVICE_FOLDER)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin.bak \

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/audio-bowser/jem.xml:/system/etc/sound/jem \
    $(COMMON_FOLDER)/audio-bowser/audio_policy.conf:/system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/apns-conf.xml:/system/etc/apns-conf.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    $(DEVICE_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini \
    $(COMMON_FOLDER)/wifi/firmware/nvram_jem_semco.txt:system/etc/wifi/nvram_jem_semco.txt \
    $(COMMON_FOLDER)/wifi/firmware/nvram_jem_usi.txt:system/etc/wifi/nvram_jem_usi.txt \
    $(COMMON_FOLDER)/wifi/firmware/nvram_jem-wan_semco.txt:system/etc/wifi/nvram_jem-wan_semco.txt \
    $(COMMON_FOLDER)/wifi/firmware/nvram_jem-wan_usi.txt:system/etc/wifi/nvram_jem-wan_usi.txt \
    $(COMMON_FOLDER)/wifi/firmware/nvram.txt:system/etc/wifi/bcmdhd.cal \
    $(COMMON_FOLDER)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Prebuilt /system/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/sensors.omap4.so:system/lib/hw/sensors.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libinvensense_hal.so:system/lib/libinvensense_hal.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmllite.so:system/lib/libmllite.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmlplatform.so:system/lib/libmlplatform.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmplmpu.so:system/lib/libmplmpu.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libril-lab126qmi.so:/system/lib/libril-lab126qmi.so \

# postrecoveryboot for recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=254 \
    ro.sf.hwrotation=90 \
    persist.hwc.mirroring.region=0:0:1920:1200 \
    persist.hwc.mirroring.transform=1 \
    persist.lab126.chargeprotect=1 \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512 \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, $(DEVICE_FOLDER)/prebuilt/camera/vendor-camera.mk)
$(call inherit-product-if-exists, $(COMMON_FOLDER)/imgtec/sgx-imgtec-bins-544.mk)
