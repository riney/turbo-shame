set -e

echo
echo "*****************"
echo Julienning system
echo "*****************"
apt-get update
apt-get -y upgrade

echo
echo "************************"
echo Deep frying dependencies
echo "************************"
apt-get -y install git-core g++ autoconf

echo
echo "***************"
echo Parboiling Ruby
echo "***************"
\curl -sSL https://get.rvm.io | bash
usermod -a -G rvm vagrant
source /etc/profile.d/rvm.sh
rvm install 2.1
rvm default use 2.1
gem install guard

echo
echo "****************"
echo Baking assembler
echo "****************"
mkdir tools
cd tools
git clone https://github.com/cc65/cc65.git
cd cc65
make
ln -s /home/vagrant/tools/cc65/bin/ca65 /usr/local/bin
ln -s /home/vagrant/tools/cc65/bin/cl65 /usr/local/bin
ln -s /home/vagrant/tools/cc65/bin/ld65 /usr/local/bin

echo
echo "**************************"
echo THE SHAME PLATE IS SERVED.
echo "**************************"
