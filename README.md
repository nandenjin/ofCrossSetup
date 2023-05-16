# ofCrossSetup

Setup tool for [openFrameworks](https://openframeworks.cc/) projects with cross-platform development by Git and [Visual Studio Code](https://code.visualstudio.com/).

## Project creation

- 🚀 Download openFrameworks from [releases page on GitHub](https://github.com/openframeworks/openFrameworks/releases).
- 🗑️ Remove unnecessary files: e.g. `docs`, `examples` or documents for original repo.
- 📚 Prepare for Git management: `.gitignore` and `.gitkeep`
- 📦 Prepare install scripts under `/scripts/cross-setup`

```bash
mkdir myProject
cd myProject
```

then

```bash
wget -O - https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/setup.sh | bash
```

## Installation for each device

- 🚀 Download pre-built projectGenerator from [`ci.openframeworks.cc/projectGenerator/`](http://ci.openframeworks.cc/projectGenerator/)
- 🚀 Download pre-built libs and binaries for addons via `download_libs.sh`

MacOS:

```bash
./scripts/cross_setup/install_osx.sh
```

Visual Studio:

```sh
./scripts/cross_setup/install_vs.sh
```

For Visual Studio on Windows, [download projectGenerator](http://ci.openframeworks.cc/projectGenerator/projectGenerator-vs.zip) and place to under `/projectGenerator`.
