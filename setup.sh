cp .git-completion.sh ~/.
cp .git-prompt.sh ~/.
cp .gitconfig ~/.
cp .vimrc ~/.

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
npm install -g \
  yarn \
  firebase-tools \
  polymer-cli \
  commitizen cz-conventional-changelog

echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# Google Cloud Platform
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y \
  google-cloud-sdk \
  build-essential

# PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
