#!/bin/bash
#
# Copyright (C) 2020 Project Fluid
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Functions

get_build_infos() {
	local RELEASE_ARTIFACT_PARTS=($(echo "$(basename "$1")" | sed 's/.zip//g' | tr "-" "\n"))
	RELEASE_ARTIFACT_VERSION_NUMBER=${RELEASE_ARTIFACT_PARTS[1]}
	RELEASE_ARTIFACT_VERSION_NAME=${RELEASE_ARTIFACT_PARTS[2]}
	RELEASE_ARTIFACT_DATE=${RELEASE_ARTIFACT_PARTS[5]}
	if [ "${RELEASE_ARTIFACT_PARTS[6]}" != "" ]; then
		RELEASE_ARTIFACT_VARIANT=${RELEASE_ARTIFACT_PARTS[6]}
	else
		RELEASE_ARTIFACT_VARIANT=vanilla
	fi
	RELEASE_ARTIFACT_SIZE="$(stat -c%s "$1")"
	RELEASE_ARTIFACT_SHA1SUM="$(sha1sum "$1" | awk '{print $1}')"
}

upload_artifact() {
	printf "Uploading build..."
        # Add the sftp keys to avoid error 6
        ssh-keyscan ${RELEASE_SFTP_SERVER} >> ~/.ssh/known_hosts
	# Recursively create dirs if they doesn't exists and upload file
	sshpass -p "$RELEASE_SF_PASSWORD" sftp -oBatchMode=no "${RELEASE_SF_USER}@${RELEASE_SFTP_SERVER}:$RELEASE_SFTP_MAIN_DIR" > /dev/null 2>&1 <<EOF
mkdir $RELEASE_DEVICE_CODENAME
cd $RELEASE_DEVICE_CODENAME
mkdir $RELEASE_ANDROID_VERSION
cd $RELEASE_ANDROID_VERSION
mkdir $RELEASE_ARTIFACT_VARIANT
cd $RELEASE_ARTIFACT_VARIANT
put $1
exit
EOF
	local RELEASE_UPLOAD_STATUS=$?
	if [ "$RELEASE_UPLOAD_STATUS" = 0 ]; then
		echo " done"
	else
		echo ""
		echo "Upload failed! Error code $RELEASE_UPLOAD_STATUS"
		exit
	fi
}

update_json() {
	cd "$RELEASE_JSON_REPO_DIR"
	if [ ! -d "${RELEASE_DEVICE_CODENAME}" ]; then
		mkdir "${RELEASE_DEVICE_CODENAME}"
	fi
	echo \
"{
	\"filename\": \"$(basename "$1")\",
	\"version\": \"$RELEASE_ARTIFACT_VERSION_NUMBER\",
	\"url\": \"https://sourceforge.net/projects/project-fluid/files/$RELEASE_DEVICE_CODENAME/${RELEASE_ANDROID_VERSION}/${RELEASE_ARTIFACT_VARIANT}/$(basename "$1")/download\",
	\"size\": \"$RELEASE_ARTIFACT_SIZE\",
	\"datetime\": $(date +%s),
	\"sha1sum\": \"$RELEASE_ARTIFACT_SHA1SUM\"
}" | jq . > "${RELEASE_DEVICE_CODENAME}/${RELEASE_ANDROID_VERSION}_${RELEASE_ARTIFACT_VARIANT}.json"
	git add "${RELEASE_DEVICE_CODENAME}/${RELEASE_ANDROID_VERSION}_${RELEASE_ARTIFACT_VARIANT}.json"
	git commit \
		--author "FluidCI <ci@fluidos.me>" \
		-m "[FluidCI] $RELEASE_DEVICE_CODENAME: $RELEASE_ANDROID_VERSION: $RELEASE_ARTIFACT_VARIANT: Update to $RELEASE_ARTIFACT_DATE"
	git push
	cd "$RELEASE_CURRENT_DIR"
}

# Script start

# Check if necessary packages are installed
[ "$(command -v git)" = "" ] && echo "Error: git package is missing, please install it" && exit
[ "$(command -v sshpass)" = "" ] && echo "Error: sshpass package is missing, please install it" && exit
[ "$(command -v sftp)" = "" ] && echo "Error: openssh package is missing, please install it" && exit
[ "$(command -v jq)" = "" ] && echo "Error: jq package is missing, please install it" && exit

# Save PWD
RELEASE_CURRENT_DIR="$(pwd)"

# Variables
RELEASE_ANDROID_VERSION="eleven"
RELEASE_JSON_REPO_DIR="tools/fluid/official_devices"
RELEASE_SFTP_SERVER="frs.sourceforge.net"
RELEASE_SFTP_MAIN_DIR="/home/frs/project/project-fluid"

echo "Fluid Releaser"
echo "Created and maintained by SebaUbuntu (barezzisebastiano@gmail.com)"
echo ""
# Get informations
read -p "Device codename: " RELEASE_DEVICE_CODENAME
[ "$RELEASE_DEVICE_CODENAME" = "" ] && echo "Device codename can't be empty" && exit
read -p "SourceForge username: " RELEASE_SF_USER
[ "$RELEASE_SF_USER" = "" ] && echo "SourceForge username can't be empty" && exit
read -s -p "SourceForge password: " RELEASE_SF_PASSWORD
[ "$RELEASE_SF_PASSWORD" = "" ] && echo "SourceForge password can't be empty" && exit
echo ""

# Get all the device official builds
RELEASE_ARTIFACTS=$(ls out/target/product/$RELEASE_DEVICE_CODENAME/Fluid-*-OFFICIAL-*.zip)
# Check if a build has been found
[ "$RELEASE_ARTIFACTS" = "" ] && echo "Error: no artifact has been found! Be sure that an official build is in out folder" && exit

# Clone json repo
echo "Cloning official_devices..."
if [ -d "$RELEASE_JSON_REPO_DIR" ]; then
	rm -rf "$RELEASE_JSON_REPO_DIR"
fi
git clone https://github.com/Project-Fluid-Devices/official_devices "$RELEASE_JSON_REPO_DIR" > /dev/null 2>&1
echo ""

for artifact in $RELEASE_ARTIFACTS; do
	get_build_infos "$artifact"
	if [ "$RELEASE_ARTIFACT_VARIANT" = "gapped" ]; then
		echo "Found a gapped build: $(basename "$artifact")"
	elif [ "$RELEASE_ARTIFACT_VARIANT" = "vanilla" ]; then
		echo "Found a vanilla build: $(basename "$artifact")"
	else
		echo "Error: Unable to determine the variant of this build: $(basename "$artifact")"
		echo "Aborting..."
		exit
	fi
	upload_artifact "$artifact"
	update_json "$artifact"
done

rm -rf "$RELEASE_JSON_REPO_DIR"

echo "FluidReleaser: All done!"
