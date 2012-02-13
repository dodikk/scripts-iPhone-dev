#!/bin/bash
#
#
#####################

APP_NAME=RIApiTest
IOS_VERSION=$1
CONFIGURATION=$2

LAUNCH_DIR=$PWD

cd ../
  SCRIPTS_ROOT_DIR=$PWD
cd "$LAUNCH_DIR"

cd ../../
    PROJECT_ROOT=$PWD
cd "$LAUNCH_DIR"

cd "$PROJECT_ROOT/test/RIApiTest"
xcodebuild -project $APP_NAME.xcodeproj -alltargets -configuration $CONFIGURATION -sdk iphonesimulator$IOS_VERSION clean build
if [ "$?" -ne "0" ]; then
   echo "[!!! ERROR !!!] : Build failed"
   echo xcodebuild -project $APP_NAME.xcodeproj -alltargets -configuration $CONFIGURATION -sdk iphonesimulator$IOS_VERSION clean build
   exit 1
fi

BUILT_PRODUCTS_DIR=$( cat /tmp/RIApiTestBuild/CI_TEST_PRODUCT_DIR.txt )

##TODO : get $BUILT_PROJECTS_DIT
cd "$BUILT_PRODUCTS_DIR/$CONFIGURATION-iphonesimulator"

   /bin/bash "$SCRIPTS_ROOT_DIR/simulator/KillSimulator.sh"
      iphonesim launch "$PWD/$APP_NAME.app" $IOS_VERSION 
   /bin/bash "$SCRIPTS_ROOT_DIR/simulator/KillSimulator.sh"
      iphonesim launch "$PWD/$APP_NAME-server.app" $IOS_VERSION 
   /bin/bash "$SCRIPTS_ROOT_DIR/simulator/KillSimulator.sh"
cd "$LAUNCH_DIR"


