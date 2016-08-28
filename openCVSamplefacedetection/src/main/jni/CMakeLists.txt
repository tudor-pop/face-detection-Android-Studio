cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)

# build native_app_glue as a static lib
include_directories(src/main/jni/native/jni)
#add_library(app-glue STATIC
#            ${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c)

# now build app's shared lib
#include_directories(./ndk_helper ${ANDROID_NDK}/sources/android/cpufeatures)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11 -Wall -fno-exceptions -fno-rtti")
file(GLOB detectionBasedTracker_SRC ./*.c*)
add_library(DetectionBasedTracker SHARED ${detectionBasedTracker_SRC})

# add lib dependencies
target_link_libraries(DetectionBasedTracker android log)
