#!/bin/zsh

# we go ever all files in this folder (except setup.org)...
for i in $(ls ./*.org | grep setup -v); do
    # ... and we tangle them by starting a minimalistic emacs instance
    echo "tangling ${i}"
    emacs -Q --batch --eval "$(cat generate.el)" "${i}"
done


# # handling emacs
# cd emacs  
# emacs -Q --batch --eval "$(cat ../generate.el)" config.org
# zsh ./install.zsh
# emacs -Q --batch --eval "(byte-compile-file \"~/.emacs.el\")"

# # finally , we restart
swaymsg reload
