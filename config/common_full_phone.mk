# Inherit full common Lineage stuff
$(call inherit-product, vendor/fluid/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/fluid/overlay/dictionaries

$(call inherit-product, vendor/fluid/config/telephony.mk)
