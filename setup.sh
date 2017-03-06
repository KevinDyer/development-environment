cp .git-completion.sh ~/.
cp .git-prompt.sh ~/.
cp .gitconfig ~/.
cp .vimrc ~/.

# Node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# NPM Permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

if [[ "0" == "$(grep -c "# NPM" ~/.bashrc)" ]]; then
  echo "# NPM" >> ~/.bashrc
  echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.bashrc
  echo "" >> ~/.bashrc
fi
npm install -g npm
npm install -g yarn firebase-tools polymer-cli

# Google Cloud Platform
# Create an environment variable for the correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
