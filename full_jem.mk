# Camera and Gallery
PRODUCT_PACKAGES := \
        Gallery

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/amazon/jem/device.mk)

PRODUCT_NAME := full_jem
PRODUCT_DEVICE := jem
PRODUCT_BRAND := google
PRODUCT_MODEL := Kindle Fire HD
PRODUCT_MANUFACTURER := amazon
