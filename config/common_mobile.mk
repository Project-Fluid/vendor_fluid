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
    FluidLauncherQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    FluidLauncherQuickStepGo
else
PRODUCT_PACKAGES += \
    FluidLauncherQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    FluidLauncherQuickStep
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    lineage_charger_animation
endif

# Customizations
PRODUCT_PACKAGES += \
    IconShapePebbleOverlay \
    IconShapeRoundedRectOverlay \
    IconShapeSquareOverlay \
    IconShapeSquircleOverlay \
    IconShapeTaperedRectOverlay \
    IconShapeTeardropOverlay \
    IconShapeVesselOverlay \

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true
