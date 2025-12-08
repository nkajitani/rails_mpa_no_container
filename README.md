# for production
managed library

## install developer tools
```bash
sudo yum groupinstall -y "Development Tools"
```

## install git image_magick
```bash
yum install git ImageMagick ImageMagick-devel
```

## install rbenv ruby
```bash
sudo yum install -y gcc make openssl-devel zlib-devel readline-devel libyaml-devel \
                    libffi-devel tar bzip2 bzip2-devel

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
source ~/.bashrc

rbenv install 3.4.7
rbenv global 3.4.7

echo "$(ruby -v)"
```

## install node.js
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24

echo "$(node -v)"
echo "$(npm -v)"
echo "$(nvm -v)"
```

## install redis
```bash
sudo amazon-linux-extras install epel -y
sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum --enablerepo=remi install -y redis

sudo systemctl enable redis
sudo systemctl start redis

echo "$(redis-cli -v)"
```

## install mysql client
```bash
sudo amazon-linux-extras enable mysql8.0
sudo yum clean metadata

sudo yum install -y mysql

echo "$(mysql --version)"
```

## fetch rails 8 application
```bash
git clone https://github.com/nkajitani/rails_mpa_no_container.git
```

## boot rails application
```bash
rails s -b 0.0.0.0
```

## reference
[git](https://git-scm.com/install/linux)  
[rbenv](https://github.com/rbenv/rbenv)  
[node.js](https://nodejs.org/ja/download)  
[redis](https://redis.io/docs/latest/operate/oss_and_stack/install/archive/install-redis/install-redis-on-linux/)
