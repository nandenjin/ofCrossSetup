if [ -z "$OF_VERSION" ]; then
    OF_VERSION=0.11.2
fi

wget https://github.com/openframeworks/openFrameworks/archive/refs/tags/$OF_VERSION.tar.gz -O openFrameworks.tar.gz
tar -xzf openFrameworks.tar.gz
rm openFrameworks.tar.gz
mv openFrameworks-$OF_VERSION/* .
rm -rf openFrameworks-$OF_VERSION

rm -rf .appveyor.yml .github
rm -rf docs examples tests other
rm -rf INSTALL.md INSTALL_FROM_GITHUB.md CODE_OF_CONDUCT.md CHANGELOG.md THANKS.md SECURITY.md CONTRIBUTING.md
rm -rf apps

touch apps/.gitkeep
mkdir -p projectGenerator
touch projectGenerator/.gitkeep

wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/templates/gitignore -O .gitignore
