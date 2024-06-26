#!/bin/bash

# Clone WordCamp.org
git clone https://github.com/WordPress/wordcamp.org.git wordcamp.test
cd wordcamp.test

# Generate and trust SSL certificates
cd .docker
mkcert -install
mkcert -cert-file wordcamp.test.pem -key-file wordcamp.test.key.pem wordcamp.test "*.wordcamp.test" events.wordpress.test

# Edit composer.json so it pulls through https instead of ssh which will cause a failure
sed -i '/"url": "https:\/\/github.com\/WordPress\/wporg-mu-plugins.git"/{s/$/,/;a\      "no-api": true
}' config/composer.json

# Clone WordPress and checkout the latest version
cd ../public_html
git clone git://core.git.wordpress.org/ mu
cd mu
git checkout 6.4

# Install PHP dependencies
cd ../..
composer install

# Install JS dependencies and build assets
nvm install
nvm use
yarn
yarn workspaces run build

# Build and boot the Docker environment
docker compose build --pull
