LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, term/src/main)
LOCAL_SRC_FILES += $(call all-java-files-under, libtermexec/src/main)
LOCAL_SRC_FILES += $(call all-java-files-under, emulatorview)
LOCAL_SRC_FILES += $(call all-java-files-under, tests/emulatorview-test)
LOCAL_SRC_FILES += libtermexec/src/main/aidl/jackpal/androidterm/libtermexec/v1/ITerminal.aidl
LOCAL_AIDL_INCLUDES := libtermexec/src/main/aidl/jackpal/androidterm/libtermexec/v1/ITerminal.aidl

LOCAL_MANIFEST_FILE := term/src/main/AndroidManifest.xml
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH), /term/src/main/res)
LOCAL_RESOURCE_DIR += $(addprefix $(LOCAL_PATH), /emulatorview/src/main/res)
$(info UGHGHGGGHGHHGGHGHHGHGHGHGHGHGHGHGHGH $(LOCAL_RESOURCE_DIR))

LOCAL_PACKAGE_NAME := jackpal.androidterm
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform

# auto-add-overlay flag will prevent the error resource
# appears in overly but not in the base package use
# add-resource to add
LOCAL_AAPT_FLAGS := --auto-add-overlay 

include $(BUILD_PACKAGE)
include $(call all-makefiles-under,$(LOCAL_PATH)/libtermexec)
