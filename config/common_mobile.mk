# Inherit common mobile Fluid stuff
$(call inherit-product, vendor/fluid/config/common.mk)

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhotoTable

# Fluid packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    FluidWalls \
    Profiles

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    Launcher3QuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStepGo
else
PRODUCT_PACKAGES += \
    Launcher3QuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true
