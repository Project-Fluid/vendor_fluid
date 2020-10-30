# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Fluid Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.display.version=$(FLUID_DISPLAY_VERSION) \
    ro.fluid.build.version=$(FLUID_BUILD_VERSION) \
    ro.fluid.build.date=$(BUILD_DATE) \
    ro.fluid.buildtype=$(FLUID_BUILD_TYPE) \
    ro.fluid.fingerprint=$(ROM_FINGERPRINT) \
    ro.fluid.version=$(FLUID_VERSION) \
    ro.fluid.device=$(FLUID_BUILD) \
    ro.modversion=$(FLUID_VERSION)
