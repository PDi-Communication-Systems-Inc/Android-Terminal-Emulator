LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, term/src/main)
LOCAL_SRC_FILES += libtermexec/src/main/aidl/jackpal/androidterm/libtermexec/v1
LOCAL_SRC_FILES += libtermexec/src/main/java/jackpal/androidterm

LOCAL_MANIFEST_FILE := term/src/main/AndroidManifest.xml
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/term/src/main/res/

LOCAL_PACKAGE_NAME := jackpal.androidterm
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform

include $(BUILD_PACKAGE)
include $(call all-makefiles-under,$(LOCAL_PATH)/libtermexec)
