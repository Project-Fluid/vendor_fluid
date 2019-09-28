# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2017-2018 AOSiP
# Copyright (C) 2019 AOSDP
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

# -----------------------------------------------------------------
# Magma OTA update package

MAGMA_TARGET_PACKAGE := $(PRODUCT_OUT)/Magma-$(MAGMA_VERSION).zip

.PHONY: otapackage magma bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
magma: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(MAGMA_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(MAGMA_TARGET_PACKAGE) | cut -d ' ' -f1 > $(MAGMA_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Magma ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"    __  __          _____ __  __             "
	@echo -e ${CL_GRN}"   |  \/  |   /\   / ____|  \/  |   /\       "
	@echo -e ${CL_GRN}"   | \  / |  /  \ | |  __| \  / |  /  \      "
	@echo -e ${CL_GRN}"   | |\/| | / /\ \| | |_ | |\/| | / /\ \     "
	@echo -e ${CL_GRN}"   | |  | |/ ____ \ |__| | |  | |/ ____ \    "
	@echo -e ${CL_GRN}"   |_|  |_/_/    \_\_____|_|  |_/_/    \_\   "
	@echo -e ""
	@echo -e "zip: "$(MAGMA_TARGET_PACKAGE)
	@echo -e "md5: `cat $(MAGMA_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(MAGMA_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: magma
