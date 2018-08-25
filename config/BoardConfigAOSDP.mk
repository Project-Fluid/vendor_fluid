ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aosdp/config/BoardConfigQcom.mk
endif

include vendor/aosdp/config/BoardConfigKernel.mk

include vendor/aosdp/config/BoardConfigSoong.mk
