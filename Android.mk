LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libjackpal-termexec2
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := libtermexec/src/main/jni/process.cpp

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libjackpal-androidterm5
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := term/src/main/jni/common.cpp \
                   term/src/main/jni/fileCompat.cpp \
                   term/src/main/jni/termExec.cpp

include $(BUILD_SHARED_LIBRARY)

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

LOCAL_PACKAGE_NAME := jackpal.androidterm
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform

# auto-add-overlay flag will prevent the error resource
# appears in overly but not in the base package use
# add-resource to add
LOCAL_AAPT_FLAGS := --auto-add-overlay 

LOCAL_SHARED_LIBRARIES := libjackpal-termexec2 \
			  libjackpal-androidterm5

include $(BUILD_PACKAGE)

