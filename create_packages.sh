#!/usr/bin/env bash

set -e

trap 'echo "Error: $0:$LINENO stopped"; exit 1' ERR

cd packages
echo "Creating packages $1"

TEMPLATE=$([ "$1" == "--bom" ] && echo "use_bom" || echo "no_bom")

echo "Using template $TEMPLATE"

for i in {1..3}
do

  PACKAGE_NAME="feature$i"

  if [ -d $PACKAGE_NAME ]; then
    rm -rf $PACKAGE_NAME    
  fi

  cp -r "../.template/$TEMPLATE" $PACKAGE_NAME
  cd $PACKAGE_NAME

  yq -i '.name = "'$PACKAGE_NAME'"' pubspec.yaml

  cd ..

  yq -i  '.dependencies += {"'$PACKAGE_NAME'": {"path": "./packages/'$PACKAGE_NAME'"}}' ../pubspec.yaml


done