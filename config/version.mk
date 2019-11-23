# Copyright (C) 2016-2017 AOSiP
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
MAGMA_CODENAME = Moonshine

TARGET_PRODUCT_SHORT := $(subst magma_,,$(MAGMA_BUILD_TYPE))

ifndef MAGMA_BUILD_TYPE
    MAGMA_BUILD_TYPE := UNOFFICIAL
endif

# Only include Updater for official, weeklies, and nightly builds
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY,$(MAGMA_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an official, weekly and nightly build
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY,$(MAGMA_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
MAGMA_BUILD_VERSION := $(MAGMA_CODENAME)
MAGMA_VERSION := $(MAGMA_BUILD_VERSION)-$(MAGMA_BUILD_TYPE)-$(MAGMA_BUILD)-$(BUILD_DATE)
ROM_FINGERPRINT := Magma/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.magma.build.version=$(MAGMA_BUILD_VERSION) \
  ro.magma.build.date=$(BUILD_DATE) \
  ro.magma.buildtype=$(MAGMA_BUILD_TYPE) \
  ro.magma.fingerprint=$(ROM_FINGERPRINT) \
  ro.magma.version=$(MAGMA_VERSION) \
  ro.magma.device=$(MAGMA_BUILD) \
  ro.modversion=$(MAGMA_VERSION)
