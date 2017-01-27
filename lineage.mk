# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from taido device
$(call inherit-product, device/motorola/taido/full_taido.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/motorola/taido/taido-vendor.mk)

PRODUCT_GMS_CLIENTID_BASE := android-motorola

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := taido
PRODUCT_NAME := lineage_taido
PRODUCT_BRAND := Motorola
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := taido
