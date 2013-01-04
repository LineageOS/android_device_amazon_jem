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

# This file includes all definitions that apply to ALL kindleHD devices, and
# are also specific to kindleHD devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/amazon/jem

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi


# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.bowser \
    lights.bowser \
    power.bowser \
    camera.bowser \
    audio.a2dp.default \
    audio.usb.default

# Audio
PRODUCT_PACKAGES += \
    audio.primary.bowser \
    audio.hdmi.bowser
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/audio/jem.xml:/system/etc/sound/jem \
    $(DEVICE_FOLDER)/audio/audio_policy.conf:/system/etc/audio_policy.conf \

# Disable for now and use prebuilts
#    sensors.bowser \
#    libinvensense_hal_bowser \
#    libmplmpu_bowser \
#    libmllite_bowser


# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    sdcard \
    setup_fs

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wpa_supplicant_conf \
    lib_driver_cmd_bcmdhd \
    libnetcmdiface

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    brcm_patchram_plus

# Misc / Testing
PRODUCT_PACKAGES += \
    evtest \
    libjni_pinyinime \
    libaudioutils \
    Music \
    tinyplay \
    tinymix \
    tinycap \
    sh \
    libwvm \
    audio_policy.default 
 
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(DEVICE_FOLDER)/root/default.prop:/root/default.prop \
    $(DEVICE_FOLDER)/root/init.bowser.rc:root/init.bowser.rc \
    $(DEVICE_FOLDER)/root/init.bowser.usb.rc:root/init.bowser.usb.rc \
    $(DEVICE_FOLDER)/root/ueventd.bowser.rc:root/ueventd.bowser.rc \

# Audio
#PRODUCT_COPY_FILES += \
#    $(DEVICE_FOLDER)/prebuilt/audio.primary.bowser.so:system/lib/hw/audio.primary.bowser.so

# Sensor BLOBS
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/sensors.omap4.so:system/lib/hw/sensors.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libinvensense_hal.so:system/lib/libinvensense_hal.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmllite.so:system/lib/libmllite.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmlplatform.so:system/lib/libmlplatform.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmplmpu.so:system/lib/libmplmpu.so \

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/battery_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/cond_start_ril \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/emmc_init.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/strace \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/temperature_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/thermal_setup.sh \

# WIFI props
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/wifi/firmware/nvram_jem_semco.txt:system/etc/wifi/nvram_jem_semco.txt \
    $(DEVICE_FOLDER)/wifi/firmware/nvram_jem_usi.txt:system/etc/wifi/nvram_jem_usi.txt \
    $(DEVICE_FOLDER)/wifi/firmware/nvram_jem-wan_semco.txt:system/etc/wifi/nvram_jem-wan_semco.txt \
    $(DEVICE_FOLDER)/wifi/firmware/nvram_jem-wan_usi.txt:system/etc/wifi/nvram_jem-wan_usi.txt \
    $(DEVICE_FOLDER)/wifi/firmware/nvram.txt:system/etc/wifi/bcmdhd.cal \
    $(DEVICE_FOLDER)/wifi/firmware/firmware.bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(DEVICE_FOLDER)/wifi/firmware/firmware.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    $(DEVICE_FOLDER)/wifi/firmware/firmware.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin \
    $(DEVICE_FOLDER)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Remove for now until I fix ducati load crash
# Ducati
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin.bak \

# SMC
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/firmware/smc_pa.ift:/system/vendor/firmware/smc_pa.ift \
    $(DEVICE_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini \

# RIL
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/libril-lab126qmi.so:/system/lib/libril-lab126qmi.so \

# Media files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# ATT APNs for LTE Model
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/apns-conf.xml:/system/etc/apns-conf.xml \

# Input
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl


# Vold
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# postrecoveryboot for recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    hwui.render_dirty_regions=false \
    ro.opengles.version=131072 \
    com.ti.omap_enhancement=true \
    omap.enhancement=true \
    ro.crypto.state=unencrypted \
    persist.sys.usb.config=mtp,adb \
    persist.sys.root_access=3 \
    ro.nf.profile=2 \
    ro.nf.level=512 \
    ro.sf.hwrotation=90 \
    persist.hwc.mirroring.region=0:0:1920:1200 \
    persist.hwc.mirroring.transform=1 \
    persist.lab126.chargeprotect=1 \
    persist.lab126.touchnoisereject=1 \

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    libdomx \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libstagefrighthw \
    libI420colorconvert \
    libtiutils \
    libcamera \
    libion_ti \
    libomxcameraadapter \
    smc_pa_ctrl \
    tf_daemon \
    libtf_crypto_sst

#    hwcomposer.omap4 \
#    camera.omap4 \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, $(DEVICE_FOLDER)/prebuilt/camera/vendor-camera.mk)
$(call inherit-product-if-exists, $(DEVICE_FOLDER)/imgtec/sgx-imgtec-bins.mk)

$(call inherit-product-if-exists, vendor/amazon/bowser/device-vendor.mk)
$(call inherit-product-if-exists, vendor/amazon/bowser/device-vendor-blobs.mk)
