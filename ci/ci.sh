#!/bin/bash

version=6.2.5
set -e -x


(
    cd image
    # pip install docker-squash
    # make base squash-base server
    make base
    make server
)

mkdir -p /opt/seafile-data
docker run -d --name seafile -e SEAFILE_SERVER_HOSTNAME=127.0.0.1 -v /opt/seafile-data:/shared -p 80:80 -p 443:443 seafileltd/seafile:$version
cat > doc.md <<EOF
# Doc

Hello world.
EOF
python ci/upload.py doc.md
echo $(pwd)
docker stop seafile
docker start seafile
docker restart seafile

rm -rf doc.md
if [[ $TRAVIS_TAG != "" ]]; then
    ci/publish-image.sh
else
    echo "Not going to push the image to docker hub, since it's not a build triggered by a tag"
fi
