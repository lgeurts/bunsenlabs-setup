#!/bin/bash
FONT_NAME="SourceCodePro"
URL="https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip"

mkdir ~/downloads/adobe
cd ~downloads/adobe
wget ${URL} -O ${FONT_NAME}.zip
unzip -o -j ${FONT_NAME}.zip
cp *.otf ~/.fonts
fc-cache -f -v
exit
