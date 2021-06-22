#!/bin/bash

./bigfuncloud/dev-setup.sh

mkdir -p out
cp frontend/graphiql.html out/graphiql.html
cp frontend/index.html out/index.html

reflex -g "*.rb" -s -- sh -c "ruby ./app.rb && invalidate-devserver" &
sleep 1 # XXX: frontend needs backend to be loaded -- do something better
reflex -g "frontend/**/*" -s -- sh -c "npm run build && invalidate-devserver" &
reflex -g "Caddyfile" -s -- sh -c "caddy run && invalidate-devserver"
