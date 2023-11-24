# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2019 The OmniRom Project
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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    vendor/omni/overlay/CarrierConfig

PRODUCT_PACKAGES += \
    FrameworksResOverlay

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/omnipreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    omnipreopt_script

# Android Auto for Wireless
ifeq ($(ROM_BUILDTYPE),$(filter $(ROM_BUILDTYPE),GAPPS))
PRODUCT_PACKAGES += \
    AndroidAutoStub
endif

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Api
PRODUCT_SHIPPING_API_LEVEL := 28

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    audio.r_submix.default \
    audio.usb.default \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libvolumelistener

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.device@3.4

# Charger images
PRODUCT_PACKAGES += \
    omni_charger_res_images \
    animation.txt \
    font_charger.png

# Display
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    libion \
    libtinyalsa \
    libtinyxml2 \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.msmnile \
    hwcomposer.msmnile \
    lights.msmnile \
    libdisplaydebug \
    libqdutils \
    libsdmcore \
    libsdmutils \
    libvulkan \
    vendor.qti.hardware.display.allocator-service

$(call inherit-product, vendor/qcom/opensource/display/config/display-product-vendor.mk)
$(call inherit-product, vendor/qcom/opensource/commonsys/display/config/display-product-commonsys.mk)
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/display/config/display-interfaces-product.mk)
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/display/config/display-product-system.mk)

-include hardware/qcom-caf/sm8150/display/config/display-board.mk
-include hardware/qcom-caf/sm8150/display/config/display-product.mk

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3.vendor

# Exclude vibrator from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

PRODUCT_BOOT_JARS += qcom.fmradio

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-asus

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor

# Netutils
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor \
    netutils-wrapper-1.0 \
    libandroid_net

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOOTLOADER_BOARD_NAME := msmnile

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.2.vendor

# Shims
PRODUCT_PACKAGES += \
    lib-imsvt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/libshim/lib-imsvideocodec.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/lib-imsvideocodec.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/omni/build/soong

# Systemhelper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    tcmiface

# Telephony extension
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# Termal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

# Tether offload
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0.vendor \
    android.hardware.tetheroffload.control@1.0.vendor

# TrustedUI
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor

# Update engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Vibrator
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-core/android.hardware.vibrator-V1-ndk_platform.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.vibrator-V1-ndk_platform.so

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

# Wifi Display
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon
