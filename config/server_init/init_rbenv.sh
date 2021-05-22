## rbenv 설치
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
sudo apt-get update
sudo apt-get install -y gcc make libssl-dev libreadline-dev zlib1g-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
rbenv install 3.0.1
rbenv global 3.0.1

## Postgresql 라이브러리 설치, psql 설정
sudo apt-get update
sudo apt-get -y install libpq-dev postgresql postgresql-contrib
echo "create role junction login password '6aaba350a19dc59c6b5b' superuser;" | sudo -u postgres psql
echo "create database junction_production;" | sudo -u postgres psql

## (optional) unf_ext Gem 설치 도중 make: g++ 패키지 부재로 인한 에러 해결을 위해 필요
sudo apt-get update
sudo apt-get -y install g++

# done
echo "success! Don't remove this file (for skip this shell script)" >> init_system_done.txt
