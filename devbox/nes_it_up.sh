echo "***************"
echo Updating system
echo "***************"
apt-get update
apt-get upgrade

echo "************************"
echo Deep frying dependencies
echo "************************"
apt-get -y install git-core g++ autoconf scons libsdl1.2-dev subversion libgtk-3-dev liblua5.1-0-dev

echo "***********************"
echo Baking wla-dx assembler
echo "***********************"
mkdir tools
cd tools
git clone https://github.com/vhelin/wla-dx.git
cd wla-dx
./unix.sh 1

echo "***************"
echo Sauteeing fceux
echo "***************"
cd /home/vagrant/tools
svn checkout http://svn.code.sf.net/p/fceultra/code/fceu/trunk fceultra
cd fceultra/src
wget http://sourceforge.net/p/fceultra/bugs/_discuss/thread/e458ff57/cfde/attachment/input.cpp.patch
patch -E -p1 < ./input.cpp.patch
rm ./drivers/common/input.cpp
cd ..
echo "--- SConstruct	2014-04-24 22:13:21.372299371 +0000
+++ SConstruct	2014-04-24 22:09:46.580603793 +0000
@@ -18,8 +18,8 @@
   BoolVariable('RELEASE',   'Set to 1 to build for release', 0),
   BoolVariable('FRAMESKIP', 'Enable frameskipping', 1),
   BoolVariable('OPENGL',    'Enable OpenGL support', 1),
-  BoolVariable('LUA',       'Enable Lua support', 1),
-  BoolVariable('GTK', 'Enable GTK2 GUI (SDL only)', 1),
+  BoolVariable('LUA',       'Enable Lua support', 0),
+  BoolVariable('GTK', 'Enable GTK2 GUI (SDL only)', 0),
   BoolVariable('GTK3', 'Enable GTK3 GUI (SDL only)', 0),
   BoolVariable('NEWPPU',    'Enable new PPU core', 1),
   BoolVariable('CREATE_AVI', 'Enable avi creation support (SDL only)', 1)," > SConstruct.patch
patch SConstruct < ./SConstruct.patch
scons install

echo "***********************"
echo Broasting .bash_profile
echo "***********************"
echo "$PATH=$PATH:/home/vagrant/tools/wla-dx/binaries" > ~/.bash_profile

echo "**************************"
echo THE SHAME PLATE IS SERVED.
echo "**************************"
