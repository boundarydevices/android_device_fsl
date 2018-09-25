OPTEE_PLATFORM ?= imx
ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),evk_8mm evk_8mm_drm))
OPTEE_PLATFORM_FLAVOR ?= mx8mmevk
else
ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),evk_8mq evk_8mq_drm))
OPTEE_PLATFORM_FLAVOR ?= mx8mqevk
else
$(error Invalid platform $(TARGET_PRODUCT))
endif
endif
OPTEE_CFG_ARM64_CORE ?= y
OPTEE_TA_TARGETS ?= ta_arm64
CFG_SECSTOR_TA_MGMT_PTA ?= y
#OPTEE_TA_TARGETS ?= ta_arm32
OPTEE_OS_DIR ?= optee/optee_os
OPTEE_EXTRA_FLAGS ?= CFG_TEE_CORE_LOG_LEVEL=1 CFG_TEE_TA_LOG_LEVEL=1 DEBUG=0
ifeq ($(CFG_SECURE_DATA_PATH), y)
OPTEE_EXTRA_FLAGS += CFG_SECURE_DATA_PATH=y
OPTEE_EXTRA_FLAGS += CFG_TEE_SDP_MEM_BASE=$(CFG_TEE_SDP_MEM_BASE)
OPTEE_EXTRA_FLAGS += CFG_TEE_SDP_MEM_SIZE=$(CFG_TEE_SDP_MEM_SIZE)
OPTEE_EXTRA_FLAGS += CFG_TEE_SDP_NONCACHE=y
else
OPTEE_EXTRA_FLAGS += CFG_SECURE_DATA_PATH=n
endif

BUILD_OPTEE_MK := $(OPTEE_OS_DIR)/mk/aosp_optee.mk

# OP TEE client library and service
PRODUCT_PACKAGES += libteec \
                    tee-supplicant \

# optee_test and TA
PRODUCT_PACKAGES += xtest
# os_test
PRODUCT_PACKAGES += 5b9e0e40-2636-11e1-ad9e-0002a5d5c51b.ta
# concurrent_large
PRODUCT_PACKAGES += 5ce0c432-0ab0-40e5-a056-782ca0e6aba2.ta
# sha_perf
PRODUCT_PACKAGES += 614789f2-39c0-4ebf-b235-92b32ac107ed.ta
# storage2
PRODUCT_PACKAGES += 731e279e-aafb-4575-a771-38caa6f0cca6.ta
# storage
PRODUCT_PACKAGES += b689f2a7-8adf-477a-9f99-32e90c0ad0a2.ta
# create_fail_test
PRODUCT_PACKAGES += c3f6e2c0-3548-11e1-b86c-0800200c9a66.ta
# crypt
PRODUCT_PACKAGES += cb3e5ba0-adf1-11e0-998b-0002a5d5c51b.ta
# rpc_test
PRODUCT_PACKAGES += d17f73a0-36ef-11e1-984a-0002a5d5c51b.ta
# concurrent
PRODUCT_PACKAGES += e13010e0-2ae1-11e5-896a-0002a5d5c51b.ta
# aes_perf
PRODUCT_PACKAGES += e626662e-c0e2-485c-b8c8-09fbce6edf3d.ta
# sims
PRODUCT_PACKAGES += e6a33ed4-562b-463a-bb7e-ff5e15a493c8.ta
# storage_benchmark
PRODUCT_PACKAGES += f157cda0-550c-11e5-a6fa-0002a5d5c51b.ta
# socket
PRODUCT_PACKAGES += 873bcd08-c2c3-11e6-a937-d0bf9c45c61c.ta
# sdp-basic
PRODUCT_PACKAGES += 12345678-5b69-11e4-9dbb-101f74f00099.ta