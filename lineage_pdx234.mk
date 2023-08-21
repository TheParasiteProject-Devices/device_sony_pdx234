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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device.mk
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common TheParasiteProject stuffs.
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_CHARGER_RESOURCE_COPY_OUT := $(TARGET_COPY_OUT_VENDOR)
TARGET_INCLUDE_CARRIER_SERVICES := true
TARGET_INCLUDE_CARRIER_SETTINGS := true
TARGET_INCLUDE_PIXEL_EUICC := true
TARGET_SUPPORTS_GOOGLE_BATTERY := false
TARGET_GBOARD_KEY_HEIGHT := 1.1
TARGET_EEA_V2_DEVICE := true
TARGET_SUPPORTS_DSE_CHOICE_SCREEN := true
TARGET_COLUMBUS_MODEL := crosshatch
TARGET_BOOT_ANIMATION_RES := 1440

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

IS_PHONE := true

PRODUCT_BUILD_PROP_OVERRIDES := \
    DeviceName=XQ-DQ72 \
    DeviceProduct=XQ-DQ72 \
    SystemDevice=XQ-DQ72 \
    SystemName=XQ-DQ72 \
    BuildFingerprint=Sony/XQ-DQ72/XQ-DQ72:15/67.2.A.2.41/067002A002004100521143226:user/release-keys \
    BuildDesc="XQ-DQ72-user 15 67.2.A.2.41 067002A002004100521143226 release-keys"

PRODUCT_NAME := lineage_pdx234
PRODUCT_DEVICE := pdx234
PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := XQ-DQ72

PRODUCT_SYSTEM_NAME := XQ-DQ72
PRODUCT_SYSTEM_DEVICE := XQ-DQ72

PRODUCT_GMS_CLIENTID_BASE := android-google
