# Inherit common stuff
$(call inherit-product, vendor/aosdp/config/common.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/aosdp/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver
