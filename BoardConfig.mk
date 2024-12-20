#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from sony sm8550-common
-include device/sony/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx234

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 420

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_pdx234
TARGET_RECOVERY_DEVICE_MODULES := libinit_pdx234

# Kernel
TARGET_KERNEL_CONFIG += vendor/sony/pdx234.config

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true

# OTA
TARGET_OTA_ASSERT_DEVICE := pdx234,XQ-DQ44,XQ-DQ54,XQ-DQ62,XQ-DQ72,SO-51D,SOG10,A301SO

# inherit from the proprietary version
-include vendor/sony/pdx234/BoardConfigVendor.mk
