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
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device.mk
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common PixelExperience stuffs.
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

TARGET_CHARGER_RESOURCE_COPY_OUT := $(TARGET_COPY_OUT_VENDOR)

# Additional Pixel stuffs
TARGET_INCLUDE_CARRIER_SETTINGS := true
TARGET_INCLUDE_CAMERA_GO := true
TARGET_SUPPORTS_LILY_EXPERIENCE := true
TARGET_NOT_SUPPORTS_GOOGLE_BATTERY := true
TARGET_FLATTEN_APEX := false
TARGET_GBOARD_KEY_HEIGHT := 1.1
$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)

TARGET_BOOT_ANIMATION_RES := 1440

TARGET_USES_AOSP_RECOVERY := true

PRODUCT_NAME := aosp_pdx234
PRODUCT_DEVICE := pdx234
PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Pdx234

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="XQ-DQ72-user 13 67.0.A.4.79 067000A004007900521143226 release-keys" \
    PRODUCT_BRAND=Sony \
    TARGET_DEVICE=pdx234 \
    PRODUCT_MANUFACTURER=Sony \
    PRODUCT_MODEL=Pdx234 \
    TARGET_PRODUCT=pdx234 \
    PRODUCT_SYSTEM_BRAND=Sony \
    PRODUCT_SYSTEM_DEVICE=pdx234 \
    PRODUCT_SYSTEM_MANUFACTURER=Sony \
    PRODUCT_SYSTEM_MODEL=Pdx234 \
    PRODUCT_SYSTEM_NAME=pdx234

BUILD_FINGERPRINT := Sony/XQ-DQ72/XQ-DQ72:13/67.0.A.4.79/067000A004007900521143226:user/release-keys
