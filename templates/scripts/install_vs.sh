echo "Installing for vs..."

# Download pre-compiled openFrameworks and extract projectGenerator
wget https://github.com/openframeworks/openFrameworks/releases/download/${OF_VERSION}/of_v${OF_VERSION}_vs2017_release.zip -O compiled-of.zip
unzip compiled-of.zip of_v${OF_VERSION}_vs2017_release/projectGenerator/*
mv of_v${OF_VERSION}_vs2017_release/projectGenerator/* projectGenerator/
rm -rf compiled-of.zip of_v${OF_VERSION}_vs2017_release

$(dirname "$0")/../vs/download_libs.sh
