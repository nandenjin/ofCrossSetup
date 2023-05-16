if [ -z "$OF_VERSION" ]; then
    OF_VERSION=0.11.2
fi

echo "\n🙋‍♂️ Installing openFrameworks v$OF_VERSION\n"


if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME=$(basename $(pwd))
fi

echo "\nProject name = $PROJECT_NAME\n"

# Download and extract openFrameworks
echo "⌛ Downloading openFrameworks\n"
wget https://github.com/openframeworks/openFrameworks/archive/refs/tags/$OF_VERSION.tar.gz -O openFrameworks.tar.gz
tar -xzf openFrameworks.tar.gz
rm openFrameworks.tar.gz
mv openFrameworks-$OF_VERSION/* .
rm -rf openFrameworks-$OF_VERSION

# Remove unnecessary files
echo "\n🗑️ Removing unnecessary files\n"
rm -rf .appveyor.yml .github
rm -rf docs examples tests other
rm -rf INSTALL.md INSTALL_FROM_GITHUB.md CODE_OF_CONDUCT.md CHANGELOG.md THANKS.md SECURITY.md CONTRIBUTING.md
rm -rf apps/*

# gitignore
echo "⌛ Creating .gitignore\n"
wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/gitignore -O .gitignore

# Create gitkeep
echo "\n🗑️ Creating .gitkeep\n"
touch apps/.gitkeep
mkdir -p projectGenerator
touch projectGenerator/.gitkeep


# Create install script
echo "\n📦 Creating install scripts\n"
INSTALL_SCRIPTS=(
    install_osx.sh
    install_vs.ps1
)
mkdir -p scripts/cross_setup
for script in ${INSTALL_SCRIPTS[@]}; do
    wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/scripts/$script -O scripts/cross_setup/$script
    chmod +x scripts/cross_setup/$script
done

# Create README
echo "\n📝 Creating README\n"
wget https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/README.md -O - | sed -e "s/PROJECT_NAME/$PROJECT_NAME/g" > README.md

echo "\n✅ Done!\n"
