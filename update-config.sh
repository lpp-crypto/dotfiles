#!/bin/zsh
# adapted from the org documentation https://orgmode.org/manual/Batch-Execution.html

# we go ever all files in this folder (except setup.org)...
for i in $(ls ./*.org | grep setup -v); do
    # ... and we tangle them by starting a minimalistic emacs instance
    echo "tangling ${i}"
    emacs -Q --batch --eval "$(cat generate.el)" "${i}"
done


# finally, we restart sway
swaymsg reload

