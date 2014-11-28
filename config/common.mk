# Brand
PRODUCT_BRAND ?= bliss

# Local path for prebuilts
LOCAL_PATH:= vendor/bliss/prebuilt/common

# Common build prop overrides 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dataroaming=false \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    keyguard.no_require_sim=true \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.build.selinux=1 \
    ro.adb.secure=1 \
    persist.sys.dun.override=0

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/bliss/overlay/common

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable sip+voip on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    $(LOCAL_PATH)/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Bootanimation support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/bootanimation.zip:system/media/bootanimation.zip

# Bliss Versioning System
-include vendor/bliss/config/versions.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/bliss/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/bliss/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/bliss/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/bliss/prebuilt/bin/blacklist:system/addon.d/blacklist

# SuperSU
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    $(LOCAL_PATH)/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
