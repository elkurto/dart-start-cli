# Dart Start CLI
- A heuristic set of dart examples that run from the commandline.

## Easiest Dart installation
- Flutter installs come with Dart runtime.
- So, the easiest means to install dart; install flutter (which includes Dart).
- On ubuntu (src = https://docs.flutter.dev/install/manual );
``` bash
# 1. install pre-req's
  sudo apt-get update -y && sudo apt-get upgrade -y
  sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# 2. download flutter zipfile (to ~/Downloads/ )
  https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.32.1-stable.tar.xz

# 3. unzip the flutter tarfile
  tar -xf ~/Downloads/flutter_linux_3.29.3-stable.tar.xz -C ~/develop/

# 4. add flutter's bin directory to your system path (in current shell or in .bashrc or .bash_profile)
#  $HOME/development/flutter/bin contains the `dart` executable and `flutter` executable
  export PATH="$HOME/development/flutter/bin:$PATH"

# 5. validate
  dart --version
    Dart SDK version: 3.8.0 (stable) (Wed May 14 09:07:14 2025 -0700) on "linux_x64"


```

