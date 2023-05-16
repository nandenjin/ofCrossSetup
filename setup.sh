if [ -z "$OF_VERSION" ]; then
    OF_VERSION=0.11.2
fi


if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME=$(basename $(pwd))
fi

# List of platforms
PLATFORMS=(osx vs)

# gitignore
wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/gitignore -O .gitignore

# Download and extract openFrameworks
wget https://github.com/openframeworks/openFrameworks/archive/refs/tags/$OF_VERSION.tar.gz -O openFrameworks.tar.gz
tar -xzf openFrameworks.tar.gz
rm openFrameworks.tar.gz
mv openFrameworks-$OF_VERSION/* .
rm -rf openFrameworks-$OF_VERSION

# Remove unnecessary files
rm -rf .appveyor.yml .github
rm -rf docs examples tests other
rm -rf INSTALL.md INSTALL_FROM_GITHUB.md CODE_OF_CONDUCT.md CHANGELOG.md THANKS.md SECURITY.md CONTRIBUTING.md
rm -rf apps/*

# Create gitkeep
touch apps/.gitkeep
mkdir -p projectGenerator
touch projectGenerator/.gitkeep

# Create setup script
for platform in ${PLATFORMS[@]}; do
    wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/scripts/install_$platform.sh -O scripts/cross_setup/install_$platform.sh
    chmod +x scripts/cross_setup/install_$platform.sh
done

# Create README
wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/README.md -O - | sed -e "s/PROJECT_NAME/$PROJECT_NAME/g" > README.md
