#!/bin/bash

echo '***************************'
echo 'BEGIN: docker-compose build'
echo '***************************'
docker-compose build
echo '******************************'
echo 'FINISHED: docker-compose build'
echo '******************************'

bash test_app.sh
# bash test_code.sh
# bash info.sh
