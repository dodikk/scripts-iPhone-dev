SRC_ROOT=$1

HEADERS=$( find "$SRC_ROOT" -name "*.h" -print )

   for HEADER in $HEADERS; do
      sed -i .sed 's/\#import "/\#import <RIApi\/CoreDataAutoGenerated\/Human\//g' $HEADER
      sed -i .sed 's/.h"/.h>/g' $HEADER
   done
   
  