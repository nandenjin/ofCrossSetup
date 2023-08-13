echo "Installing for vs..."

wget http://ci.openframeworks.cc/projectGenerator/projectGenerator-vs.zip -O projectGenerator.zip
unzip -q projectGenerator.zip
mv projectGenerator-vs/* projectGenerator/
rm -rf projectGenerator-vs projectGenerator.zip

$(dirname "$0")/../vs/download_libs.sh
