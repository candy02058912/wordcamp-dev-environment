FROM gitpod/workspace-full

# Install additional packages and dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    git \
    curl \
    unzip \
    && sudo rm -rf /var/lib/apt/lists/*

# Install nvm
RUN bash -c 'VERSION="lts/gallium" \
    && source $HOME/.nvm/nvm.sh && nvm install $VERSION \
    && nvm use $VERSION && nvm alias default $VERSION'
RUN echo "nvm use default &>/dev/null" >> ~/.bashrc.d/51-nvm-fix

# Install mkcert and nss
RUN sudo apt-get update && sudo apt-get install -y libnss3-tools
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
    chmod +x mkcert-v*-linux-amd64 && \
    sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
