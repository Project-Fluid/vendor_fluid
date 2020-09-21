# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.version=$(FLUID_VERSION) \
    ro.fluid.releasetype=$(FLUID_BUILDTYPE) \
    ro.fluid.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(FLUID_VERSION) \
    ro.fluidlegal.url=https://fluidos.me/legal

# Fluid Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.display.version=$(FLUID_DISPLAY_VERSION)
