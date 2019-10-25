#!/bin/bash -e

if [ ! -d gradle ]; then
	echo "Run this in build/android"
	exit 1
fi

echo
echo "*** Starting build Minetest for Android... ***"

echo
echo "=> Getting precompiled dependencies:"
if [ ! -d native/deps ]
then
  echo
  git clone --depth 1 https://github.com/MultiCraft/deps native/deps
  echo
  echo "* Done!"
else
  echo
  echo "Already available, skipping..."
fi


echo
echo "*** All done! You can continue in Android Studio! ***"
