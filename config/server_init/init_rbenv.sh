git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
sudo apt-get update
sudo apt-get install -y gcc make libssl-dev libreadline-dev zlib1g-dev
sudo apt-get update
wget -qS https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash
rbenv install 3.0.1
