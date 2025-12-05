# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit Android Go configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

# WiFi-only device configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Inherit from gtexswifi device
$(call inherit-product, device/samsung/gtexswifi/device.mk)

PRODUCT_DEVICE := gtexswifi
PRODUCT_NAME := aosp_gtexswifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T280
PRODUCT_MANUFACTURER := samsung

# WiFi-only device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.radio.noril=true

# Android Go optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=8 \
    ro.statsd.enable=false

# Reduce dalvik heap sizes for Go
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=samsung/gtexswifixx/gtexswifi:5.1.1/LMY47V/T280XXU0AQA4:user/release-keys \
    PRIVATE_BUILD_DESC="gtexswifixx-user 5.1.1 LMY47V T280XXU0AQA4 release-keys"
