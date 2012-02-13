#/bin/bash
#
######################

## This script is used in junction with the Jenkins xCode plug-in.
## artifacts can be found at .../<FrameworkProjectDir>/build/Release-iphoneos/<FrameworkName>.framework


## setup environment ##
LAUNCH_DIR=$PWD

cd ../
   SCRIPTS_ROOT=$PWD
cd "$LAUNCH_DIR"

cd ../../
   PROJECT_ROOT=$PWD
cd "$LAUNCH_DIR"


DEPLOYMENT_DIR=$PROJECT_ROOT/deployment
DEBUG_ARTIFACT_DIR=$(cat /tmp/ReutersInsiderBuild/PRODUCT_DIR.txt)

DEBUG_BUILD_NAME=ReutersInsider-Debug-iphonesimulator.zip

## prepare deployment dir
rm -rf "$DEPLOYMENT_DIR"
mkdir -p "$DEPLOYMENT_DIR"


## copy artifacts
cd "$PROJECT_ROOT/app/ReutersInsider/build/Debug-iphoneos/"
  cp *.ipa "$DEPLOYMENT_DIR"
cd "$LAUNCH_DIR"


cd "$DEBUG_ARTIFACT_DIR/Debug-iphonesimulator"
   zip -r "$DEBUG_BUILD_NAME" "ReutersInsider.app"
   cp "$DEBUG_BUILD_NAME" "$DEPLOYMENT_DIR"
cd "$LAUNCH_DIR"


##Upload to TestFlight
echo "============DEPLOYING TO TESTFLIGHT==============="
cd "$DEPLOYMENT_DIR"
   pwd
   ls

   ls -1 *.ipa

   IPA_FILE=$( ls -1 *.ipa )
   echo "IPA_FILE - $IPA_FILE"
   echo "IPA_FILE - $PWD/$IPA_FILE"

   echo "--invoking file--"
   file "$IPA_FILE"

   /bin/bash "$PROJECT_ROOT/scripts/build/UploadToTestFlight.sh" "$IPA_FILE"
cd "$LAUNCH_DIR"


