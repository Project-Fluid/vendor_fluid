# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
FLUID_CODENAME := Rum
FLUID_NUM_VER := 1.6

TARGET_PRODUCT_SHORT := $(subst fluid_,,$(FLUID_BUILD_TYPE))

FLUID_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official, weeklies, CI and nightly builds
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY CI,$(FLUID_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an official, weekly, CI and nightly build
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY CI,$(FLUID_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
FLUID_BUILD_VERSION := $(FLUID_NUM_VER)-$(FLUID_CODENAME)
FLUID_VERSION := $(FLUID_BUILD_VERSION)-$(FLUID_BUILD_TYPE)-$(FLUID_BUILD)-$(BUILD_DATE)
ifeq ($(TARGET_INCLUDE_GAPPS), true)
FLUID_VERSION := $(FLUID_VERSION)-gapped
endif
ROM_FINGERPRINT := Fluid/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
FLUID_DISPLAY_VERSION := $(FLUID_VERSION)
RELEASE_TYPE := $(FLUID_BUILD_TYPE)
