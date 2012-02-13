DerivedData=~/Library/Developer/Xcode/DerivedData

rm -rf "$DerivedData"
mkdir -p "$DerivedData"

rm -rf ./trunk/app/ReutersInsider/build
rm -rf ./trunk/lib/RIApi/build

exit 0;
