#!/bin/bash

yarn install
yarn run eslint
CI=true yarn run test