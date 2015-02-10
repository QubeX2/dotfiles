#!/bin/bash
if [ ! -d bundle ]; then
    mkdir bundle
    git clone https://github.com/hbin/molokai-theme.git
    git clone https://github.com/fxbois/web-mode.git
fi

