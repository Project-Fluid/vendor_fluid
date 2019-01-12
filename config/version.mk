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
PRODUCT_VERSION_MAJOR = 9
PRODUCT_VERSION_MINOR = 0

DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst aosdp_,,$(AOSDP_BUILDTYPE))

AOSDP_BUILDTYPE ?= Alpha
AOSDP_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
AOSDP_VERSION := $(AOSDP_BUILD_VERSION)-$(AOSDP_BUILDTYPE)-$(AOSDP_BUILD)-$(DATE)
ROM_FINGERPRINT := AOSDP/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.aosdp.build.version=$(AOSDP_BUILD_VERSION) \
  ro.aosdp.build.date=$(DATE) \
  ro.aosdp.buildtype=$(AOSDP_BUILDTYPE) \
  ro.aosdp.fingerprint=$(ROM_FINGERPRINT) \
  ro.aosdp.version=$(AOSDP_VERSION) \
  ro.aosdp.device=$(AOSDP_BUILD) \
  ro.modversion=$(AOSDP_VERSION)
