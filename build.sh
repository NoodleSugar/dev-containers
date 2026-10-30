#!/bin/sh

readonly SCRIPT_DIR="$(realpath $(dirname $0))"

readonly IMAGE="$1"
readonly DOCKERFILE="$SCRIPT_DIR/$IMAGE.Dockerfile"

if ! [ -f $DOCKERFILE ]; then
	echo "File $DOCKERFILE not found." >&2
	exit 1
fi

if [ -x "$(command -v docker)" ]; then
	readonly BUILDER="docker"
elif [ -x "$(command -v podman)" ]; then
	readonly BUILDER="podman"
else
	echo "No image builder found." >&2
	exit 1
fi

echo "Building image '$IMAGE' with $BUILDER..."
"$BUILDER" build . -f "$IMAGE.Dockerfile" -t "noodle/$IMAGE"
