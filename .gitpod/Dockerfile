FROM gitpod/workspace-full

# Install additional packages and dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    git \
    curl \
    unzip \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Node.js and Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm install -g yarn

# Install mkcert and nss
RUN sudo apt-get update && sudo apt-get install -y libnss3-tools
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
    chmod +x mkcert-v*-linux-amd64 && \
    sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer