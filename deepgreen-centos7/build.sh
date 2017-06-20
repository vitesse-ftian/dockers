#!/bin/bash


function download {
if [ -f $2 ]; then
    echo "Using already downloaded $2." 
else 
    echo "Download $2." 
    curl -O $1/$2 
fi
}

DEEPGREEN=deepgreendb.16.17.rh6.x86_64.170521.bin
GO=go1.8.linux-amd64.tar.gz

download http://storage.googleapis.com/vitessedata/download $DEEPGREEN
download https://storage.googleapis.com/golang $GO

# dotfiles.   emacs users beware. 
# (cd; tar zcf dotfiles.tgz .vimrc .vim .tmux.conf .gitconfig)
# mv ~/dotfiles.tgz .

docker build --no-cache=true -t deepgreen-centos7 .
