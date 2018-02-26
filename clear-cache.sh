#!/bin/sh

if [[ -z "${ZONE_ID}" ]]; then
  echo "Environment variable ZONE_ID is not found"
  exit 1
fi

if [[ -z "${AUTH_EMAIL}" ]]; then
  echo "Environment variable AUTH_EMAIL is not found"
  exit 1
fi

if [[ -z "${AUTH_KEY}" ]]; then
  echo "Environment variable AUTH_KEY is not found"
  exit 1
fi

echo "--> Clearing cloudflare cache"
http_response=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" \
      -X DELETE \
      "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
     -H "X-Auth-Email: $AUTH_EMAIL" \
     -H "X-Auth-Key: $AUTH_KEY" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}')

body=$(echo $http_response | sed -e 's/HTTPSTATUS\:.*//g')
status_code=$(echo $http_response | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')

if [ ! $status_code -eq 200 ]; then
  echo "--> Cloud flare cache clearance failed. Please visit cloudflare.com to manually delete it"
  echo $body
  exit 1
fi
echo "--> Cloud flare cache cleared successfully"
