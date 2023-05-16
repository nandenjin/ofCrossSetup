echo "Installing for osx..."

wget http://ci.openframeworks.cc/projectGenerator/projectGenerator-osx.zip -O projectGenerator.zip
unzip -q projectGenerator.zip
mv projectGenerator-osx/* projectGenerator/
rm -rf projectGenerator-osx projectGenerator.zip

../osx/install_osx.sh
