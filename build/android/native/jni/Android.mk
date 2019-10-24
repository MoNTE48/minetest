LOCAL_PATH := $(call my-dir)/..

#LOCAL_ADDRESS_SANITIZER:=true

include $(CLEAR_VARS)
LOCAL_MODULE := Irrlicht
LOCAL_SRC_FILES := deps/Android/Irrlicht/${COMPILER_VERSION}/$(APP_ABI)/libIrrlicht.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := LevelDB
LOCAL_SRC_FILES := deps/Android/LevelDB/${COMPILER_VERSION}/$(APP_ABI)/libleveldb.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Curl
LOCAL_SRC_FILES := deps/Android/Curl/${COMPILER_VERSION}/$(APP_ABI)/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Freetype
LOCAL_SRC_FILES := deps/Android/Freetype/${COMPILER_VERSION}/$(APP_ABI)/libfreetype.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := OpenAL
LOCAL_SRC_FILES := deps/Android/OpenAL-Soft/${COMPILER_VERSION}/$(APP_ABI)/libopenal.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Vorbis
LOCAL_SRC_FILES := deps/Android/Vorbis/${COMPILER_VERSION}/$(APP_ABI)/libvorbis.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Minetest

LOCAL_CFLAGS += \
	-DJSONCPP_NO_LOCALE_SUPPORT      \
	-DHAVE_TOUCHSCREENGUI            \
	-DENABLE_GLES=1                  \
	-DUSE_CURL=1                     \
	-DUSE_SOUND=1                    \
	-DUSE_FREETYPE=1                 \
	-DUSE_LEVELDB=1                  \
	$(GPROF_DEF)

ifdef NDEBUG
	LOCAL_CFLAGS += -DNDEBUG=1
endif

ifdef GPROF
	GPROF_DEF := -DGPROF
	PROFILER_LIBS := android-ndk-profiler
	LOCAL_CFLAGS += -pg
endif

LOCAL_C_INCLUDES := \
		../../../src                                   \
		../../../src/script                            \
		../../../lib/gmp                               \
		../../../lib/lua/src                           \
		../../../lib/jsoncpp                           \
		../../../src/cguittfont                        \
		deps/Android/irrlicht/include                  \
		deps/Android/libiconv/include                  \
		deps/Android/libiconv/libcharset/include       \
		deps/Android/Freetype/include                  \
		deps/Android/Curl/include                      \
		deps/Android/OpenAL-Soft/include               \
		deps/Android/Vorbis/include                    \
		deps/Android/leveldb/include                   \
		deps/Android/sqlite/

LOCAL_SRC_FILES := \
		../../../src/ban.cpp                           \
		../../../src/chat.cpp                          \
		../../../src/client/activeobjectmgr.cpp        \
		../../../src/client/camera.cpp                 \
		../../../src/client/client.cpp                 \
		../../../src/client/clientenvironment.cpp      \
		../../../src/client/clientlauncher.cpp         \
		../../../src/client/clientmap.cpp              \
		../../../src/client/clientmedia.cpp            \
		../../../src/client/clientobject.cpp           \
		../../../src/client/clouds.cpp                 \
		../../../src/client/content_cao.cpp            \
		../../../src/client/content_cso.cpp            \
		../../../src/client/content_mapblock.cpp       \
		../../../src/client/filecache.cpp              \
		../../../src/client/fontengine.cpp             \
		../../../src/client/game.cpp                   \
		../../../src/client/gameui.cpp                 \
		../../../src/client/guiscalingfilter.cpp       \
		../../../src/client/hud.cpp                    \
		../../../src/clientiface.cpp                   \
		../../../src/client/imagefilters.cpp           \
		../../../src/client/inputhandler.cpp           \
		../../../src/client/joystick_controller.cpp    \
		../../../src/client/keycode.cpp                \
		../../../src/client/localplayer.cpp            \
		../../../src/client/mapblock_mesh.cpp          \
		../../../src/client/mesh.cpp                   \
		../../../src/client/meshgen/collector.cpp      \
		../../../src/client/mesh_generator_thread.cpp  \
		../../../src/client/minimap.cpp                \
		../../../src/client/particles.cpp              \
		../../../src/client/render/anaglyph.cpp        \
		../../../src/client/render/core.cpp            \
		../../../src/client/render/factory.cpp         \
		../../../src/client/renderingengine.cpp        \
		../../../src/client/render/interlaced.cpp      \
		../../../src/client/render/pageflip.cpp        \
		../../../src/client/render/plain.cpp           \
		../../../src/client/render/sidebyside.cpp      \
		../../../src/client/render/stereo.cpp          \
		../../../src/client/shader.cpp                 \
		../../../src/client/sky.cpp                    \
		../../../src/client/sound.cpp                  \
		../../../src/client/sound_openal.cpp           \
		../../../src/client/tile.cpp                   \
		../../../src/client/wieldmesh.cpp              \
		../../../src/collision.cpp                     \
		../../../src/content/content.cpp               \
		../../../src/content_mapnode.cpp               \
		../../../src/content/mods.cpp                  \
		../../../src/content_nodemeta.cpp              \
		../../../src/content/packages.cpp              \
		../../../src/content_sao.cpp                   \
		../../../src/content/subgames.cpp              \
		../../../src/convert_json.cpp                  \
		../../../src/craftdef.cpp                      \
		../../../src/database/database.cpp             \
		../../../src/database/database-dummy.cpp       \
		../../../src/database/database-files.cpp       \
		../../../src/database/database-leveldb.cpp     \
		../../../src/database/database-sqlite3.cpp     \
		../../../src/debug.cpp                         \
		../../../src/defaultsettings.cpp               \
		../../../src/emerge.cpp                        \
		../../../src/environment.cpp                   \
		../../../src/face_position_cache.cpp           \
		../../../src/filesys.cpp                       \
		../../../src/genericobject.cpp                 \
		../../../src/gettext.cpp                       \
		../../../src/gui/guiButton.cpp                 \
		../../../src/gui/guiChatConsole.cpp            \
		../../../src/gui/guiConfirmRegistration.cpp    \
		../../../src/gui/guiEditBoxWithScrollbar.cpp   \
		../../../src/gui/guiEngine.cpp                 \
		../../../src/gui/guiFormSpecMenu.cpp           \
		../../../src/gui/guiKeyChangeMenu.cpp          \
		../../../src/gui/guiPasswordChange.cpp         \
		../../../src/gui/guiPathSelectMenu.cpp         \
		../../../src/gui/guiScrollBar.cpp              \
		../../../src/gui/guiSkin.cpp                   \
		../../../src/gui/guiTable.cpp                  \
		../../../src/gui/guiVolumeChange.cpp           \
		../../../src/gui/intlGUIEditBox.cpp            \
		../../../src/gui/modalMenu.cpp                 \
		../../../src/gui/profilergraph.cpp             \
		../../../src/gui/touchscreengui.cpp            \
		../../../src/httpfetch.cpp                     \
		../../../src/hud.cpp                           \
		../../../src/inventory.cpp                     \
		../../../src/inventorymanager.cpp              \
		../../../src/irrlicht_changes/CGUITTFont.cpp   \
		../../../src/irrlicht_changes/static_text.cpp  \
		../../../src/itemdef.cpp                       \
		../../../src/itemstackmetadata.cpp             \
		../../../src/light.cpp                         \
		../../../src/log.cpp                           \
		../../../src/main.cpp                          \
		../../../src/mapblock.cpp                      \
		../../../src/map.cpp                           \
		../../../src/mapgen/cavegen.cpp                \
		../../../src/mapgen/dungeongen.cpp             \
		../../../src/mapgen/mapgen_carpathian.cpp      \
		../../../src/mapgen/mapgen.cpp                 \
		../../../src/mapgen/mapgen_flat.cpp            \
		../../../src/mapgen/mapgen_fractal.cpp         \
		../../../src/mapgen/mapgen_singlenode.cpp      \
		../../../src/mapgen/mapgen_v5.cpp              \
		../../../src/mapgen/mapgen_v6.cpp              \
		../../../src/mapgen/mapgen_v7.cpp              \
		../../../src/mapgen/mapgen_valleys.cpp         \
		../../../src/mapgen/mg_biome.cpp               \
		../../../src/mapgen/mg_decoration.cpp          \
		../../../src/mapgen/mg_ore.cpp                 \
		../../../src/mapgen/mg_schematic.cpp           \
		../../../src/mapgen/treegen.cpp                \
		../../../src/mapnode.cpp                       \
		../../../src/mapsector.cpp                     \
		../../../src/map_settings_manager.cpp          \
		../../../src/metadata.cpp                      \
		../../../src/modchannels.cpp                   \
		../../../src/nameidmapping.cpp                 \
		../../../src/nodedef.cpp                       \
		../../../src/nodemetadata.cpp                  \
		../../../src/nodetimer.cpp                     \
		../../../src/noise.cpp                         \
		../../../src/objdef.cpp                        \
		../../../src/object_properties.cpp             \
		../../../src/pathfinder.cpp                    \
		../../../src/player.cpp                        \
		../../../src/porting_android.cpp               \
		../../../src/porting.cpp                       \
		../../../src/profiler.cpp                      \
		../../../src/raycast.cpp                       \
		../../../src/reflowscan.cpp                    \
		../../../src/remoteplayer.cpp                  \
		../../../src/rollback.cpp                      \
		../../../src/rollback_interface.cpp            \
		../../../src/serialization.cpp                 \
		../../../src/server/activeobjectmgr.cpp        \
		../../../src/server.cpp                        \
		../../../src/serverenvironment.cpp             \
		../../../src/serverlist.cpp                    \
		../../../src/server/mods.cpp                   \
		../../../src/serverobject.cpp                  \
		../../../src/settings.cpp                      \
		../../../src/staticobject.cpp                  \
		../../../src/tileanimation.cpp                 \
		../../../src/tool.cpp                          \
		../../../src/translation.cpp                   \
		../../../src/unittest/test_authdatabase.cpp    \
		../../../src/unittest/test_collision.cpp       \
		../../../src/unittest/test_compression.cpp     \
		../../../src/unittest/test_connection.cpp      \
		../../../src/unittest/test.cpp                 \
		../../../src/unittest/test_filepath.cpp        \
		../../../src/unittest/test_gameui.cpp          \
		../../../src/unittest/test_inventory.cpp       \
		../../../src/unittest/test_mapnode.cpp         \
		../../../src/unittest/test_map_settings_manager.cpp \
		../../../src/unittest/test_nodedef.cpp         \
		../../../src/unittest/test_noderesolver.cpp    \
		../../../src/unittest/test_noise.cpp           \
		../../../src/unittest/test_objdef.cpp          \
		../../../src/unittest/test_profiler.cpp        \
		../../../src/unittest/test_random.cpp          \
		../../../src/unittest/test_schematic.cpp       \
		../../../src/unittest/test_serialization.cpp   \
		../../../src/unittest/test_settings.cpp        \
		../../../src/unittest/test_socket.cpp          \
		../../../src/unittest/test_utilities.cpp       \
		../../../src/unittest/test_voxelalgorithms.cpp \
		../../../src/unittest/test_voxelmanipulator.cpp\
		../../../src/util/areastore.cpp                \
		../../../src/util/auth.cpp                     \
		../../../src/util/base64.cpp                   \
		../../../src/util/directiontables.cpp          \
		../../../src/util/enriched_string.cpp          \
		../../../src/util/ieee_float.cpp               \
		../../../src/util/numeric.cpp                  \
		../../../src/util/pointedthing.cpp             \
		../../../src/util/quicktune.cpp                \
		../../../src/util/serialize.cpp                \
		../../../src/util/sha1.cpp                     \
		../../../src/util/sha256.c                     \
		../../../src/util/srp.cpp                      \
		../../../src/util/string.cpp                   \
		../../../src/util/timetaker.cpp                \
		../../../src/version.cpp                       \
		../../../src/voxelalgorithms.cpp               \
		../../../src/voxel.cpp

# Network
LOCAL_SRC_FILES += \
		../../../src/network/address.cpp               \
		../../../src/network/connection.cpp            \
		../../../src/network/networkpacket.cpp         \
		../../../src/network/clientopcodes.cpp         \
		../../../src/network/clientpackethandler.cpp   \
		../../../src/network/connectionthreads.cpp     \
		../../../src/network/serveropcodes.cpp         \
		../../../src/network/serverpackethandler.cpp   \
		../../../src/network/socket.cpp                \

# lua api
LOCAL_SRC_FILES += \
		../../../src/script/common/c_content.cpp       \
		../../../src/script/common/c_converter.cpp     \
		../../../src/script/common/c_internal.cpp      \
		../../../src/script/common/c_types.cpp         \
		../../../src/script/common/helper.cpp          \
		../../../src/script/cpp_api/s_async.cpp        \
		../../../src/script/cpp_api/s_base.cpp         \
		../../../src/script/cpp_api/s_client.cpp       \
		../../../src/script/cpp_api/s_entity.cpp       \
		../../../src/script/cpp_api/s_env.cpp          \
		../../../src/script/cpp_api/s_inventory.cpp    \
		../../../src/script/cpp_api/s_item.cpp         \
		../../../src/script/cpp_api/s_mainmenu.cpp     \
		../../../src/script/cpp_api/s_modchannels.cpp  \
		../../../src/script/cpp_api/s_node.cpp         \
		../../../src/script/cpp_api/s_nodemeta.cpp     \
		../../../src/script/cpp_api/s_player.cpp       \
		../../../src/script/cpp_api/s_security.cpp     \
		../../../src/script/cpp_api/s_server.cpp       \
		../../../src/script/lua_api/l_areastore.cpp    \
		../../../src/script/lua_api/l_auth.cpp         \
		../../../src/script/lua_api/l_base.cpp         \
		../../../src/script/lua_api/l_camera.cpp       \
		../../../src/script/lua_api/l_client.cpp       \
		../../../src/script/lua_api/l_craft.cpp        \
		../../../src/script/lua_api/l_env.cpp          \
		../../../src/script/lua_api/l_inventory.cpp    \
		../../../src/script/lua_api/l_item.cpp         \
		../../../src/script/lua_api/l_itemstackmeta.cpp\
		../../../src/script/lua_api/l_localplayer.cpp  \
		../../../src/script/lua_api/l_mainmenu.cpp     \
		../../../src/script/lua_api/l_mapgen.cpp       \
		../../../src/script/lua_api/l_metadata.cpp     \
		../../../src/script/lua_api/l_minimap.cpp      \
		../../../src/script/lua_api/l_modchannels.cpp  \
		../../../src/script/lua_api/l_nodemeta.cpp     \
		../../../src/script/lua_api/l_nodetimer.cpp    \
		../../../src/script/lua_api/l_noise.cpp        \
		../../../src/script/lua_api/l_object.cpp       \
		../../../src/script/lua_api/l_playermeta.cpp   \
		../../../src/script/lua_api/l_particles.cpp    \
		../../../src/script/lua_api/l_particles_local.cpp\
		../../../src/script/lua_api/l_rollback.cpp     \
		../../../src/script/lua_api/l_server.cpp       \
		../../../src/script/lua_api/l_settings.cpp     \
		../../../src/script/lua_api/l_sound.cpp        \
		../../../src/script/lua_api/l_http.cpp         \
		../../../src/script/lua_api/l_storage.cpp      \
		../../../src/script/lua_api/l_util.cpp         \
		../../../src/script/lua_api/l_vmanip.cpp       \
		../../../src/script/scripting_client.cpp       \
		../../../src/script/scripting_server.cpp       \
		../../../src/script/scripting_mainmenu.cpp

# Freetype2 support
#LOCAL_SRC_FILES += ../../../src/cguittfont/xCGUITTFont.cpp

# GMP
LOCAL_SRC_FILES += ../../../lib/gmp/mini-gmp.c

# Lua
LOCAL_SRC_FILES += \
		../../../lib/lua/src/lapi.c                    \
		../../../lib/lua/src/lauxlib.c                 \
		../../../lib/lua/src/lbaselib.c                \
		../../../lib/lua/src/lcode.c                   \
		../../../lib/lua/src/ldblib.c                  \
		../../../lib/lua/src/ldebug.c                  \
		../../../lib/lua/src/ldo.c                     \
		../../../lib/lua/src/ldump.c                   \
		../../../lib/lua/src/lfunc.c                   \
		../../../lib/lua/src/lgc.c                     \
		../../../lib/lua/src/linit.c                   \
		../../../lib/lua/src/liolib.c                  \
		../../../lib/lua/src/llex.c                    \
		../../../lib/lua/src/lmathlib.c                \
		../../../lib/lua/src/lmem.c                    \
		../../../lib/lua/src/loadlib.c                 \
		../../../lib/lua/src/lobject.c                 \
		../../../lib/lua/src/lopcodes.c                \
		../../../lib/lua/src/loslib.c                  \
		../../../lib/lua/src/lparser.c                 \
		../../../lib/lua/src/lstate.c                  \
		../../../lib/lua/src/lstring.c                 \
		../../../lib/lua/src/lstrlib.c                 \
		../../../lib/lua/src/ltable.c                  \
		../../../lib/lua/src/ltablib.c                 \
		../../../lib/lua/src/ltm.c                     \
		../../../lib/lua/src/lundump.c                 \
		../../../lib/lua/src/lvm.c                     \
		../../../lib/lua/src/lzio.c                    \
		../../../lib/lua/src/print.c

# SQLite3
LOCAL_SRC_FILES += deps/Android/sqlite/sqlite3.c

# Threading
LOCAL_SRC_FILES += \
		../../../src/threading/event.cpp             \
		../../../src/threading/semaphore.cpp         \
		../../../src/threading/thread.cpp

# JSONCPP
LOCAL_SRC_FILES += ../../../lib/jsoncpp/jsoncpp.cpp

# iconv
LOCAL_SRC_FILES += \
	deps/Android/libiconv/lib/iconv.c               \
	deps/Android/libiconv/libcharset/lib/localcharset.c

LOCAL_STATIC_LIBRARIES += Irrlicht LevelDB Curl Freetype OpenAL Vorbis android_native_app_glue $(PROFILER_LIBS)

LOCAL_LDLIBS := -lEGL -lGLESv1_CM -lGLESv2 -landroid -lOpenSLES

include $(BUILD_SHARED_LIBRARY)

ifdef GPROF
$(call import-module,android-ndk-profiler)
endif
$(call import-module,android/native_app_glue)
