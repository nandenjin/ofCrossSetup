if [ $# -eq 0 ]
  then
    echo "Error: No arguments supplied"
    exit 1
fi

echo "Installing for $1..."

wget http://ci.openframeworks.cc/projectGenerator/projectGenerator-$1.zip -O projectGenerator.zip
unzip -q projectGenerator.zip
mv projectGenerator-$1/* projectGenerator/
rm -rf projectGenerator-$1 projectGenerator.zip
