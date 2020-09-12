#!/bin/bash

echo ''
echo '*********************************************************************'
echo 'IMPORTANT: This app needs the right values for environment variables.'
echo 'work in the development environment.'
echo
echo '+++++++++++++++++++++++++++++++++++++++++++++'
echo 'Enter the value for SNOWPACK_PUBLIC_DATA_URL:'
read SNOWPACK_PUBLIC_DATA_URL
echo
echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'Enter the value for SNOWPACK_PUBLIC_MAPBOXGL_ACCESS_TOKEN:'
read SNOWPACK_PUBLIC_MAPBOXGL_ACCESS_TOKEN
echo
echo '+++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'Enter the value for SNOWPACK_PUBLIC_TRACK_JS_TOKEN:'
read SNOWPACK_PUBLIC_TRACK_JS_TOKEN
echo
echo '++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'Enter the value for SNOWPACK_PUBLIC_TRANSLATION_URL:'
read SNOWPACK_PUBLIC_TRANSLATION_URL

fill_in_params () {
  STR1=$1
  STR2=$2
  FILE_TO_UPDATE='.env'
  # NOTE: Using \ instead of / as delimiter in sed command
  sed -i.bak "s|$STR1|$STR2|g" $FILE_TO_UPDATE
  rm $FILE_TO_UPDATE.bak
}

cp .env.example .env

fill_in_params '<Access token provided by mapbox to use the service>' $SNOWPACK_PUBLIC_MAPBOXGL_ACCESS_TOKEN
fill_in_params '<Link to google sheet with location information>' $SNOWPACK_PUBLIC_DATA_URL
fill_in_params '<Link to google sheet with translation info>' $SNOWPACK_PUBLIC_TRANSLATION_URL
fill_in_params '<Access token provided by trackjs to use its services>' $SNOWPACK_PUBLIC_TRACK_JS_TOKEN
