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


## prepare deployment dir
rm -rf "$DEPLOYMENT_DIR"
mkdir -p "$DEPLOYMENT_DIR"


## archive frameworks ##
cd "$PROJECT_ROOT/lib/RIApi/build/Release-iphoneos"
   zip -r --symlinks "$DEPLOYMENT_DIR/RIApiFW.framework.zip" "RIApiFW.framework"
cd "$LAUNCH_DIR"

cd "$PROJECT_ROOT/lib/ExpandableTree/lib/ExpandableTree/build/Release-iphoneos"
   zip -r --symlinks "$DEPLOYMENT_DIR/ExpandableTreeFW.framework.zip" "ExpandableTreeFW.framework"
cd "$LAUNCH_DIR"

cd "$PROJECT_ROOT/lib-third-party/MagicalRecord/MagicalRecordLibrary/build/Release-iphoneos"
   zip -r --symlinks "$DEPLOYMENT_DIR/MagicalRecordLibrary.framework.zip" "MagicalRecordLibrary.framework"
cd "$LAUNCH_DIR"

cd "$PROJECT_ROOT/lib-third-party/CocoaLumberjack/Lumberjack/LumberjackLogger/build/Release-iphoneos"
   zip -r --symlinks "$DEPLOYMENT_DIR/LumberjackLoggerFW.framework.zip" "LumberjackLoggerFW.framework"
cd "$LAUNCH_DIR"

cd "$PROJECT_ROOT/lib-third-party/EGOTableViewPullRefresh/lib/EGOPullToRefresh/build/Release-iphoneos"
   zip -r --symlinks "$DEPLOYMENT_DIR/EGOPullToRefreshFW.framework.zip" "EGOPullToRefreshFW.framework"
cd "$LAUNCH_DIR"

