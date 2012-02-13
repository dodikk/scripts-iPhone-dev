## !/bin/bash
## Download mogenerator here: http://rentzsch.github.com/mogenerator/

LAUNCH_DIR=$PWD

PATH_TO_MODEL=$1
GENERATE_TO=$2

MOGENERATOR=$( which mogenerator )

echo "PATH_TO_MODEL - ${PATH_TO_MODEL}"
echo "GENERATE_TO   - ${GENERATE_TO}"


cd "$GENERATE_TO"
   GENERATE_TO=$PWD
cd "$LAUNCH_DIR"

MACHINE_DIR=$GENERATE_TO/Machine
HUMAN_DIR=$GENERATE_TO/Human

rm -rf "$MACHINE_DIR"
mkdir -p "$MACHINE_DIR"

echo $MOGENERATOR --model $PATH_TO_MODEL --human-dir $HUMAN_DIR --machine-dir $MACHINE_DIR
$MOGENERATOR --template-var arc=true --model "$PATH_TO_MODEL" --human-dir "$HUMAN_DIR" --machine-dir "$MACHINE_DIR"


