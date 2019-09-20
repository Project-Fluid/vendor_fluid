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

# Version of the Rom
MAGMA_CODENAME = Moonshine

TARGET_PRODUCT_SHORT := $(subst magma_,,$(MAGMA_BUILDTYPE))

MAGMA_BUILDTYPE ?= Alpha
MAGMA_BUILD_VERSION := $(MAGMA_CODENAME)
MAGMA_VERSION := $(MAGMA_BUILD_VERSION)-$(MAGMA_BUILDTYPE)-$(MAGMA_BUILD)-$(shell date -u +%Y%m%d)
ROM_FINGERPRINT := MAGMA/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.magma.build.version=$(MAGMA_BUILD_VERSION) \
  ro.magma.buildtype=$(MAGMA_BUILDTYPE) \
  ro.magma.fingerprint=$(ROM_FINGERPRINT) \
  ro.magma.version=$(MAGMA_VERSION) \
  ro.magma.device=$(MAGMA_BUILD) \
  ro.modversion=$(MAGMA_VERSION)
