#!/usr/bin/env zsh

VERSION=30.2

if [[ -a ./emacs-$VERSION/src/emacs ]]; then
    echo "emacs-$VERSION is already present, no need to download/compile it"
    return
fi

if [[ ! -a ./emacs-$VERSION ]]; then
    echo "directory not found, downloading"
    wget https://ftp.snt.utwente.nl/pub/software/gnu/emacs/emacs-$VERSION.tar.xz
    tar -xvf ./emacs-$VERSION.tar.xz
else
    echo "no need to download"
fi

cd emacs-$VERSION/
./configure --with-native-compilation \
              --with-tree-sitter \
              --with-modules \
              --with-threads \
              --with-mailutils \
              --with-gif \
              --with-png \
              --with-jpeg \
              --with-rsvg \
              --with-tiff \
              --with-imagemagick \
              --without-x \
              --with-pgtk
  make clean
  make -j8
