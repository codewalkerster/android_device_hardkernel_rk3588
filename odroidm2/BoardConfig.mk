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
include device/hardkernel/rk3588/BoardConfig.mk
BUILD_WITH_GO_OPT := false

# AB image definition
BOARD_USES_AB_IMAGE := false
BOARD_ROCKCHIP_VIRTUAL_AB_ENABLE := false

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
    include device/hardkernel/common/BoardConfig_AB.mk
    TARGET_RECOVERY_FSTAB := device/hardkernel/rk3588/odroidm2/recovery.fstab_AB
endif

BOARD_HAVE_ON_BOARD_BLUETOOTH := false
#BOARD_WIFI_SUPPORT := false

PRODUCT_UBOOT_CONFIG := odroid_rk3588s
PRODUCT_KERNEL_DTS := rk3588s-odroid-m2-android
BOARD_CAMERA_SUPPORT_EXT := true
BOARD_HS_ETHERNET := true
PRODUCT_KERNEL_CONFIG += odroidm2.config
