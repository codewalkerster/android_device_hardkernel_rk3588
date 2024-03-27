#
# Copyright 2014 The Android Open-Source Project
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

# First lunching is T, api_level is 33
PRODUCT_SHIPPING_API_LEVEL := 33

PRODUCT_DTB_TARGET := kernel-5.10/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2-android.dtb
PRODUCT_DTBO_TARGET := kernel-5.10/arch/arm64/boot/dts/rockchip/overlays/odroidm2/*.dtbo

PRODUCT_SDMMC_DEVICE := fe2c0000.mmc

include device/hardkernel/common/build/rockchip/DynamicPartitions.mk
include device/hardkernel/rk3588/odroidm2/BoardConfig.mk
include device/hardkernel/common/BoardConfig.mk
$(call inherit-product, device/hardkernel/rk3588/device.mk)
$(call inherit-product, device/hardkernel/common/device.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := odroidm2
PRODUCT_DEVICE := odroidm2
PRODUCT_BRAND := hardkernel
PRODUCT_MODEL := odroidm2
PRODUCT_MANUFACTURER := hardkernel
PRODUCT_AAPT_PREF_CONFIG := xhdpi
#
## add Rockchip properties
#
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320
PRODUCT_PROPERTY_OVERRIDES += ro.wifi.sleep.power.down=true
PRODUCT_PROPERTY_OVERRIDES += persist.wifi.sleep.delay.ms=0
PRODUCT_PROPERTY_OVERRIDES += persist.bt.power.down=true
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=DSI
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=HDMI-A,eDP
#PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=HDMI-A,eDP
#PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=DSI

#
# ODROID-M2 Files
#

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/config.ini.template:$(TARGET_COPY_OUT_VENDOR)/etc/config.ini.template

ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PACKAGES += \
    AndroidTerm \

PRODUCT_PACKAGES += \
    SprUsr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../proprietary/bin/phh-su:$(TARGET_COPY_OUT_SYSTEM)/bin/phh-su \
    $(LOCAL_PATH)/../../proprietary/bin/su:$(TARGET_COPY_OUT_SYSTEM)/bin/su \
    $(LOCAL_PATH)/../../proprietary/etc/init/su.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/su.rc
endif

ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.official=https://dn.odroid.com/RK3588/ODROID-M2/Android/13/userdebug/ \
    ro.url.mirror=https://www.odroid.in/mirror/dn.odroid.com/RK3588/ODROID-M2/Android/13/userdebug/
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.official=https://dn.odroid.com/RK3588/ODROID-M2/Android/13/ \
    ro.url.mirror=https://www.odroid.in/mirror/dn.odroid.com/RK3588/ODROID-M2/Android/13/
endif
