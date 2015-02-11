#!/bin/bash
if [ ! -d bundle ]; then
    mkdir bundle
    git clone https://github.com/mileszs/ack.vim.git bundle/ack.vim
    git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
    git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree
    git clone git://github.com/shawncplus/phpcomplete.vim.git bundle/phpcomplete.vim
    git clone https://github.com/ervandew/supertab.git bundle/supertab
    git clone git://github.com/majutsushi/tagbar bundle/tagbar
    git submodule add git://github.com/SirVer/ultisnips.git bundle/ultisnips
    git clone https://github.com/bling/vim-airline bundle/vim-airline
    git clone git://github.com/klen/python-mode.git bundle/python-mode
fi

