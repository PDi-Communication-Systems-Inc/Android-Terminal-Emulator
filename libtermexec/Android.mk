LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libjackpal-termexec2
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := src/main/jni/process.cpp

include $(BUILD_SHARED_LIBRARY)
