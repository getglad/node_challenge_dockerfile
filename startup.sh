#!/usr/bin/env

cd /usr/local/interview_backend2 && npm install
cd /usr/local/interview_backend2/dist && pm2 start ./index.js -i 4 --name="api"
nginx

