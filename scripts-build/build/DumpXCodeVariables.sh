#
#/bin/bash
#
## Dump XCode variables


XCODE_DUMP_DIR=/tmp/${PRODUCT_NAME}Build
mkdir -p "$XCODE_DUMP_DIR"
CI_TEST_PRODUCT_DIR_FILE=$XCODE_DUMP_DIR/PRODUCT_DIR.txt

cd "$BUILT_PRODUCTS_DIR"
cd ..
echo $PWD > "$CI_TEST_PRODUCT_DIR_FILE"

exit 0
