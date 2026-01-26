#!/bin/sh

set -e

curl -s -o genres.json https://api.thegamesdb.net/v1/Genres?apikey=$API_KEY
curl -s -o developers.json https://api.thegamesdb.net/v1/Developers?apikey=$API_KEY
curl -s -o publishers.json https://api.thegamesdb.net/v1/Publishers?apikey=$API_KEY

git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"

git add genres.json developers.json publishers.json database-reduced.json
git commit -m "update devpubgen at $(date)"
git push origin main
