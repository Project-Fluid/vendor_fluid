# Inherit mini common Lineage stuff
$(call inherit-product, vendor/fluid/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME
