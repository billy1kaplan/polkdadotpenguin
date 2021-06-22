#!/bin/bash

set -e

eval "$(direnv export bash)"

npm install
npm run build
cp frontend/index.html out/
cp frontend/graphiql.html out/

export IMAGE=registry.$BFC_DOMAIN/$BFC_USER/$BFC_APP:latest
docker build -t "$IMAGE" .
docker push "$IMAGE"
