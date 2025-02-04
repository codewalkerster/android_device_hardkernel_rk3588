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

TARGET_BOARD_PLATFORM_PRODUCT := car

# First lunching is S, api_level is 31
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_DTBO_TEMPLATE := $(LOCAL_PATH)/dt-overlay.in

include device/hardkernel/common/build/rockchip/DynamicPartitions.mk
include device/hardkernel/rk3588/rk3588m_car/BoardConfig.mk
include device/hardkernel/common/BoardConfig.mk
$(call inherit-product, device/hardkernel/rk3588/device.mk)
$(call inherit-product, device/hardkernel/common/device.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, packages/apps/Camera360/camera360_etc.mk)
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../overlay
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_CHARACTERISTICS := car

PRODUCT_NAME := rk3588m_car
PRODUCT_DEVICE := rk3588m_car
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := rk3588m_car
PRODUCT_MANUFACTURER := rockchip
PRODUCT_AAPT_PREF_CONFIG := mdpi
#
## add Rockchip properties
#
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
PRODUCT_PROPERTY_OVERRIDES += ro.wifi.sleep.power.down=true
PRODUCT_PROPERTY_OVERRIDES += persist.wifi.sleep.delay.ms=0
PRODUCT_PROPERTY_OVERRIDES += persist.bt.power.down=true
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.compose_policy=0
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=DSI
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=HDMI-A,eDP
PRODUCT_PROPERTY_OVERRIDES += sys.mouse.presentation=1
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.reserved_plane_name=Esmart3-win0
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.env_xml_path=/vendor/etc/HwComposerEnv-multidisplay.xml

PRODUCT_COPY_FILES += $(LOCAL_PATH)/HwComposerEnv-multidisplay.xml:vendor/etc/HwComposerEnv-multidisplay.xml

ifeq ($(BOARD_CAMERA360_SUPPORT),true)
	PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.car.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.car.rc \
	$(LOCAL_PATH)/camera360/camera360.sh:system/bin/camera360.sh \
	$(LOCAL_PATH)/camera360/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
endif

PRODUCT_PACKAGES += \
     modetest
