ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/magma/config/BoardConfigQcom.mk
endif

include vendor/magma/config/BoardConfigKernel.mk

include vendor/magma/config/BoardConfigSoong.mk
