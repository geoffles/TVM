TVM - Terraform Version Manager
===============================

TVM is a version manager script for terraform. This is useful if you need to run multiple versions of terraform.

Usage
-----

-  `tvm`: Shows the current set Terraform path and lists available versions managed by TVM
-  `tvm <version>`: Sets the current Terraform path to the specific version managed by TVM
-  `tvm checkupdates`: Checks the available versions of Terraform that can be installed
-  `tvm install <version>`: (Under construction) Install the specified version of Terraform

Configuration
-------------

You will need to set some TVM settings:

-  `TERRAFORM_DIR`: Where to keep your Terraform binaries (eg: $APPDATA/terraform, /usr/terraform, )
-  `PLATFORM`: The target platform binaries to install (windows_amd64)

Currently, you can set these in the `tvm.sh` environment variables near the top of the file.

Installation
------------

### Windows

Installation on windows requires a shell environment, for example Git Bash.

1.  Copy `tvm.sh` and `LICENSE` to somewhere (eg: /c/tools/tvm/, or $APPDATA/tvm/)
2.  Create `/etc/profile.d` to load TVM when you start a shell (see example below)

Example profile.d script:
```
. $APPDATA/tvm/tvm.sh
```

### Linux

1.  Copy `tvm.sh` and `LICENSE` to somewhere (eg: /usr/tvm/, or /opt/tvm/)
2.  Create a symlink to your profile.d (eg: ln -s /usr/tvm/tvm.sh /etc/profile.d/tvm.sh)

