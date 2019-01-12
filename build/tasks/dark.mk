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
# AOSDP OTA update package

AOSDP_TARGET_PACKAGE := $(PRODUCT_OUT)/AOSDP-$(AOSDP_VERSION).zip

.PHONY: otapackage dark bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
dark: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(AOSDP_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(AOSDP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(AOSDP_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}AOSDP ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"             ____   _____ _____  _____     "
	@echo -e ${CL_GRN}"       /\   / __ \ / ____|  __ \|  __ \    "
	@echo -e ${CL_GRN}"      /  \ | |  | | (___ | |  | | |__) |   "
	@echo -e ${CL_GRN}"     / /\ \| |  | |\___ \| |  | |  ___/    "
	@echo -e ${CL_GRN}"    / ____ \ |__| |____) | |__| | |        "
	@echo -e ${CL_GRN}"   /_/    \_\____/|_____/|_____/|_|        "
	@echo -e ""
	@echo -e "zip: "$(AOSDP_TARGET_PACKAGE)
	@echo -e "md5: `cat $(AOSDP_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(AOSDP_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: dark
