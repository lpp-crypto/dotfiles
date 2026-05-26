#!/usr/bin/env zsh
#!/usr/bin/env zsh

if [[ ! $PI2_6_SAGE_LOADED ]]; then
    . ~/dotfiles/scripts/sage-conda-open.zsh
fi
env python3 $@
