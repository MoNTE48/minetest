#!/bin/bash -e

if [ ! -d gradle ]; then
	echo "Run this in build/android"
	exit 1
fi

FOLDER=$(pwd)/app/src/main/assets
DEST=$(mktemp -d)

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
echo "=> Creating Assets:"

for dir in builtin textures; do
	cp -r ../../$dir $DEST/$dir
done

mkdir -p $DEST/fonts
cp ../../fonts/DroidSansFallbackFull.ttf $DEST/fonts/ # no PNG fonts because freetype


mkdir -p $FOLDER

echo
echo "** Creating Files.zip"
ZIPDEST=$FOLDER/Files.zip
rm -f $ZIPDEST
cd $DEST; zip -0qr $ZIPDEST -- *
cd $FOLDER; rm -rf $DEST

###########

cd ../../../../..;

echo "*** Creating games.zip"
ZIPDEST=$FOLDER/games.zip
rm -f $ZIPDEST
zip -0r $ZIPDEST -- games


echo
echo "*** All done! You can continue in Android Studio! ***"
