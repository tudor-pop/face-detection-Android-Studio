LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := dlib
LOCAL_SRC_FILES := libdlib.a
include $(PREBUILT_STATIC_LIBRARY)

############### OPENCV ################
include $(CLEAR_VARS)

OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
#OPENCV_LIB_TYPE:=SHARED
ifdef OPENCV_ANDROID_SDK
  ifneq ("","$(wildcard $(OPENCV_ANDROID_SDK)/OpenCV.mk)")
    include ${OPENCV_ANDROID_SDK}/OpenCV.mk
  else
    include ${OPENCV_ANDROID_SDK}/sdk/native/jni/OpenCV.mk
  endif
else
	include $(LOCAL_PATH)/native/jni/OpenCV.mk
  # include ../../sdk/native/jni/OpenCV.mk
endif

LOCAL_MODULE     := detection_based_tracker
LOCAL_SRC_FILES  := DetectionBasedTracker_jni.cpp
LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_LDLIBS     += -llog -ldl

LOCAL_STATIC_LIBRARIES :=  dlib

include $(BUILD_SHARED_LIBRARY)
