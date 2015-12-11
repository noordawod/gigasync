#!/bin/sh

if [ "x$3" = "x" ]; then
	echo "Syntax: $0 <rsync-options> <src-dir> <target-dir> [run-size-mb]"
	exit 1
fi

# Get the options
RSYNC_OPTIONS=$1

# Get source and target directories.
SRC_DIR="`realpath $2`"
TARGET_DIR="`realpath $3`"

# Run size in Mbs.
if [ "x$4" = "x" ]; then
	RUN_SIZE=256
else
	RUN_SIZE=$4
fi

# Validate directories.
if [ ! -d $SRC_DIR ]; then
	echo "Source directory invalid: $SRC_DIR"
	exit 2
fi
if [ ! -d $TARGET_DIR ]; then
	echo "Target directory invalid: $TARGET_DIR"
	exit 2
fi

# Debug.
echo " "
echo "Backing up:"
echo "  Source directory: $SRC_DIR/"
echo "  Target directory: $TARGET_DIR/"
echo "  Rsync options:    $RSYNC_OPTIONS"
echo "  Run size in Mb:   $RUN_SIZE"
echo "  Command:"
echo "    gigasync --run-size '$RUN_SIZE' '$SRC_DIR/' '$TARGET_DIR/'"
echo " "

# Execute.
export RSYNC_OPTIONS=$RSYNC_OPTIONS
gigasync --run-size $RUN_SIZE "$SRC_DIR/" "$TARGET_DIR/"
