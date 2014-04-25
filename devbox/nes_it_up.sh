set -e

echo
echo "*****************"
echo Julienning system
echo "*****************"
apt-get update
apt-get upgrade

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
echo "***********************"
echo Baking wla-dx assembler
echo "***********************"
mkdir tools
cd tools
git clone https://github.com/vhelin/wla-dx.git
cd wla-dx
./unix.sh 1

echo
echo "***********************"
echo Broasting .bash_profile
echo "***********************"
echo "$PATH=$PATH:/home/vagrant/tools/wla-dx/binaries" > ~/.bash_profile

echo
echo "**************************"
echo THE SHAME PLATE IS SERVED.
echo "**************************"
