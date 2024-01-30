#!/bin/bash

yarn install
yarn run eslint

# env-cmd: A tool to run commands using the environment 
# -f ./.env: The -f flag specifies the file from which to read the environment variables, 
# in this case, .env located in the current directory.
yarn run env-cmd -f ./.env jest --coverage --forceExit