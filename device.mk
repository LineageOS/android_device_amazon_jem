DEVICE_FOLDER := device/amazon/jem
TARGET_BOOTLOADER_BOARD_SUBTYPE := jem

$(call inherit-product, device/amazon/bowser-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/init.bowser.rc:root/init.bowser.rc

# HALs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/hw/sensors.omap4.so:system/lib/hw/sensors.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/lib/hw/audio.primary.bowser.so:system/lib/hw/audio.primary.bowser.so

# Prebuilt firmware
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/firmware/smc_pa.ift:/system/vendor/firmware/smc_pa.ift \
    $(DEVICE_FOLDER)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/jem.xml:/system/etc/sound/jem \
#    $(DEVICE_FOLDER)/prebuilt/etc/apns-conf.xml:/system/etc/apns-conf.xml

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Prebuilt /system/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/hw/sensors.omap4.so:system/lib/hw/sensors.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libinvensense_hal.so:system/lib/libinvensense_hal.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmllite.so:system/lib/libmllite.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmlplatform.so:system/lib/libmlplatform.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libmplmpu.so:system/lib/libmplmpu.so \
    $(DEVICE_FOLDER)/prebuilt/lib/libril-lab126qmi.so:/system/lib/libril-lab126qmi.so

# Prebuilt /system/vendor/
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/vendor/data/ds1-default.xml:system/vendor/data/ds1-default.xml \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/anlg_dock_headset.csv:system/vendor/smartvolume/anlg_dock_headset.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/aux_digital.csv:system/vendor/smartvolume/aux_digital.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_a2dp.csv:system/vendor/smartvolume/bt_a2dp.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_a2dp_headphones.csv:system/vendor/smartvolume/bt_a2dp_headphones.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_a2dp_speaker.csv:system/vendor/smartvolume/bt_a2dp_speaker.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_sco_carkit.csv:system/vendor/smartvolume/bt_sco_carkit.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_sco.csv:system/vendor/smartvolume/bt_sco.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/bt_sco_headset.csv:system/vendor/smartvolume/bt_sco_headset.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/default.csv:system/vendor/smartvolume/default.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/dgtl_dock_headeset.csv:system/vendor/smartvolume/dgtl_dock_headeset.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/earpiece.csv:system/vendor/smartvolume/earpiece.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/fm_radio_tx.csv:system/vendor/smartvolume/fm_radio_tx.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/speaker.csv:system/vendor/smartvolume/speaker.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/wired_headphone.csv:system/vendor/smartvolume/wired_headphone.csv \
    $(DEVICE_FOLDER)/prebuilt/vendor/smartvolume/wired_headset.csv:system/vendor/smartvolume/wired_headset.csv

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=254 \
    ro.sf.hwrotation=90 \
    persist.hwc.mirroring.region=0:0:1920:1200 \
    persist.hwc.mirroring.transform=1 \
    persist.lab126.chargeprotect=1 \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

