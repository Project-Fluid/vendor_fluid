# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2017-2018 AOSiP
# Copyright (C) 2019 AOSDP
# Copyright (C) 2020-2021 Fluid
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
# Fluid OTA update package

FLUID_TARGET_PACKAGE := $(PRODUCT_OUT)/Fluid-$(FLUID_VERSION).zip
MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

ifneq ($(IS_CIENV),true)
  CL_RED="\033[31m"
  CL_GRN="\033[32m"
  CL_CYN="\033[36m"
endif

.PHONY: fluid otapackage bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
fluid: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FLUID_TARGET_PACKAGE)
	$(hide) $(MD5) $(FLUID_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FLUID_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Fluid! ${txtrst}";
	@echo -e ""
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*,,,,,,,,,,,#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@****,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@******,,,,,,,,,*,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@#*******,,,,,,,,,,,,,,,*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@**********************,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@/***************************,@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@&****************************,*@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@/*/////***********************,(@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@////////*/*********************,@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@////////************************@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@////////**********************@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@///////*********************@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@//////*///////**********@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//////////////******@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/////////***@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_CYN}"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	@echo -e ${CL_GRN}"----- Enjoy! -----"
	@echo -e ""
	@echo -e "zip: "$(FLUID_TARGET_PACKAGE)
	@echo -e "md5: `cat $(FLUID_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:` ls -lah $(FLUID_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: fluid
