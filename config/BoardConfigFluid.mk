ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/fluid/config/BoardConfigQcom.mk
endif

include vendor/fluid/config/BoardConfigKernel.mk

include vendor/fluid/config/BoardConfigSoong.mk
