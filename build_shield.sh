#!/bin/bash
set -e

echo "Shield source path set to ${SB_SRC_PATH}"
if [ -z "$SB_SRC_PATH" ] 
then
    echo "Please define SB_SRC_PATH to the local SB repo path. but it in ~/.bashrc e.g. export SB_SRC_PATH=/home/ionut/shield/SB "
    exit 1
fi

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH


AN_PATH_JS="$SB_SRC_PATH/Containers/Docker/shield-icap/AccessNowSrc/lib/tree_mirror.js"
CEF_PATH_JS="$SB_SRC_PATH/Containers/Docker/shield-cef/src/tree_mirror.js"
echo "Compiling typescript.."
tsc

echo "Copying to Shield source"

cp dist/tree_mirror.js $AN_PATH_JS
cp dist/tree_mirror.js $CEF_PATH_JS

