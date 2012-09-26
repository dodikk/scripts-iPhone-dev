
LAUNCH_DIR=$PWD
IOS_VERSION=$1

if [ "$IOS_VERSION" == "" ]; then
    IOS_VERSION=6.0
fi

cd ~/Library/Application\ Support/iPhone\ Simulator/$IOS_VERSION/
    rm -rf ./Applications
    mkdir -p ./Applications
cd "$LAUNCH_DIR"
