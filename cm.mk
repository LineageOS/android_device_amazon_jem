TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1200

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration for bowser
$(call inherit-product, device/amazon/jem/full_jem.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/jem/overlay/cm

PRODUCT_NAME := cm_jem
PRODUCT_DEVICE := jem
PRODUCT_BRAND := Android
PRODUCT_MODEL := Amazon Kindle Fire HD
PRODUCT_MANUFACTURER := Amazon
PRODUCT_RELEASE_NAME := KindleFireHD



