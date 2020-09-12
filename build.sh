#!/bin/bash

if [ ! -f .env ]; then
  bash config_env.sh
fi

# BEGIN: activate NVM
export NVM_DIR="/home/`whoami`/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

echo '----------------------'
echo 'BEGIN: installing Node'
echo '----------------------'
nvm install `cat .node-version`
echo '--------------------'
echo 'END: installing Node'
echo '--------------------'

echo '------------------'
echo 'BEGIN: npm install'
echo '------------------'
npm install
echo '----------------'
echo 'END: npm install'
echo '----------------'

echo '-------------'
echo 'npm run build'
npm run build
