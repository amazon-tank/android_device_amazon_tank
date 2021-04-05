#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Device Path
DEVICE_PATH := device/amazon/tank

## Inherit Dalvik Heap
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

## Vendor Blobs
$(call inherit-product, vendor/amazon/tank/tank-vendor.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# ADB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.sys.usb.config=adb

# ATV
PRODUCT_IS_ATV_SDK := true
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Debug
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/debug.rc:system/etc/init/debug.rc

# Display
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Graphics
PRODUCT_PACKAGES += \
    libion \
    libstlport

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/display/display_conf:system/etc/display_conf

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video.xml \
    $(DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS := $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(DEVICE_PATH)/configs/permissions/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml

# Rootdir
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${DEVICE_PATH}/rootdir,root)

# Shims
PRODUCT_PACKAGES += \
    libshim_log

# TV
PRODUCT_PACKAGES += \
    CMLeanbackCustomizer \
    LiveTv \
    TvProvider \
    TvSettings \
    tv_input.default

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
