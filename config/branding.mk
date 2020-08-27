# Set all versions
CUSTOM_BUILD_TYPE ?= UNOFFICIAL

CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)

CUSTOM_PLATFORM_VERSION := 10.0
FLUID_NUM_VERSION := 0.6
FLUID_CODENAME := Quenol

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

FLUID_VERSION := $(FLUID_NUM_VERSION)-$(FLUID_CODENAME)
CUSTOM_VERSION := Fluid-$(FLUID_VERSION)-$(CUSTOM_BUILD_TYPE)-$(CUSTOM_BUILD)-$(CUSTOM_BUILD_DATE)
CUSTOM_VERSION_PROP := ten

CUSTOM_PROPERTIES := \
    com.fluid.version=$(CUSTOM_VERSION_PROP) \
    com.fluid.version.display=$(CUSTOM_VERSION) \
    com.fluid.build_date=$(CUSTOM_BUILD_DATE) \
    com.fluid.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    ro.fluid.buildtype=$(CUSTOM_BUILD_TYPE) \
    ro.fluid.build.version=$(FLUID_VERSION)
