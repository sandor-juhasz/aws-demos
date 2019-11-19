
To build a whl package from the source code, please execute

python3 setup.py sdist bdist_wheel


To install the package in editable mode, please issue

pip install --editable .

This will create a symbolic link for the package and will create the shell script to invoke the command line utility.

Removing the package:

pip uninstall edl-asset-catalog

