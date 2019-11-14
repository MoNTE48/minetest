Minetest: Android version
=========================

Requirements
------------

In order to build, your PC has to be set up to build Minetest in the usual
manner (see the regular Minetest documentation for how to get this done).
In addition to what is required for Minetest in general, you will need the
following software packages. The version number in parenthesis denotes the
version that was tested at the time this README was drafted; newer/older
versions may or may not work.

* Android SDK (29+)
* Android NDK (r20b)
* Android Studio 3 [optional]

Additionally, you'll need to have an Internet connection available on the
build system, as the Android build will download some source packages.

Build
-----

The new build system Minetest Android is fully functional and is designed to speed up and simplify the work, as well as adding the possibility of cross-platform build.
You can use "./gradlew assemblerelease" or "./graldew assembledebug" from the command line or use Android Studio and click the build button.

When using gradlew, the newest NDK will be downloaded and installed automatically. Or you can create a local.properties file and specify sdk.dir and ndk.dir yourself.
The script will automatically create an APK for all the architectures specified in build.gradle.
