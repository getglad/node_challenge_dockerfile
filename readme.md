# Interview Dockerfile

## Overview

This is a Dockerfile to build and run the companion [NodeJS API server](https://github.com/getglad/node_challenge) and [Angular front end](https://github.com/getglad/node_challenge_frontend).

The container executes startup.sh to launch the applications.

It is recommended to run the build using:
```
docker run -it -p 80:80 -p 8080:8080  getglad/interview
```