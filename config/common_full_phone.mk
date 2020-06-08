# Inherit common stuff
$(call inherit-product, vendor/fluid/config/common.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/fluid/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Messaging
ifneq ($(EXCLUDE_MESSAGING_APP),true)
PRODUCT_PACKAGES += messaging
endif
