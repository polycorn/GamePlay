# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

SAMPLE_PATH := $(call my-dir)/../../src
LIBPNG_PATH := $(call my-dir)/../../../../external-deps/libpng/lib/android/arm
ZLIB_PATH := $(call my-dir)/../../../../external-deps/zlib/lib/android/arm
BULLET_PATH := $(call my-dir)/../../../../external-deps/bullet/lib/android/arm

# gameplay
LOCAL_PATH := $(call my-dir)/../../../../gameplay/android/obj/local/armeabi
include $(CLEAR_VARS)
LOCAL_MODULE    := libgameplay
LOCAL_SRC_FILES := libgameplay.a
include $(PREBUILT_STATIC_LIBRARY)

# libpng
LOCAL_PATH := $(LIBPNG_PATH)
include $(CLEAR_VARS)
LOCAL_MODULE    := libpng 
LOCAL_SRC_FILES := libpng.a
include $(PREBUILT_STATIC_LIBRARY)

# libzlib
LOCAL_PATH := $(ZLIB_PATH)
include $(CLEAR_VARS)
LOCAL_MODULE    := libzlib
LOCAL_SRC_FILES := libzlib.a
include $(PREBUILT_STATIC_LIBRARY)

# libbullet
LOCAL_PATH := $(BULLET_PATH)
include $(CLEAR_VARS)
LOCAL_MODULE    := libbullet
LOCAL_SRC_FILES := libbullet.a
include $(PREBUILT_STATIC_LIBRARY)

# sample00-mesh
LOCAL_PATH := $(SAMPLE_PATH)
include $(CLEAR_VARS)

LOCAL_MODULE    := sample00-mesh
LOCAL_SRC_FILES := ../../../gameplay/src/gameplay-main-android.cpp MeshGame.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv2 -lOpenSLES
LOCAL_CFLAGS    := -D__ANDROID__ -I"../../../external-deps/bullet/include" -I"../../../external-deps/libpng/include" -I"../../../gameplay/src"

LOCAL_STATIC_LIBRARIES := android_native_app_glue libgameplay libpng libzlib libbullet

include $(BUILD_SHARED_LIBRARY)
$(call import-module,android/native_app_glue)
