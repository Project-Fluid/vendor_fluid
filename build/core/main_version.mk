# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Fluid Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.display.version=$(FLUID_DISPLAY_VERSION)
