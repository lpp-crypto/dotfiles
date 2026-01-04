#!/bin/zsh
# adapted from the org documentation https://orgmode.org/manual/Batch-Execution.html

# we go ever all files in this folder (except setup.org)...
for i in $(ls ./*.org | grep setup -v); do
    # ... and we tangle them by starting a minimalistic emacs instance
    echo "tangling ${i}"
    emacs -Q --batch --eval "$(cat generate.el)" "${i}"
done


# the .emacs file is compiled for a faster startup
cd emacs
emacs -Q --batch --eval "$(cat ../generate.el)" config.org
cd ..
emacs -Q --batch --eval "(byte-compile-file \"~/.emacs.el\")"

# finally, we restart sway
swaymsg reload

