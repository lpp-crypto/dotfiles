if [[ $(hostname) == "a-laptop" ]]; then
    __conda_setup="$('/home/leo/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/leo/miniforge3/etc/profile.d/conda.sh" ]; then
            . "/home/leo/miniforge3/etc/profile.d/conda.sh"
        else
            export PATH="/home/leo/miniforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    if [ -f "/home/leo/miniforge3/etc/profile.d/mamba.sh" ]; then
        . "/home/leo/miniforge3/etc/profile.d/mamba.sh"
    fi

    conda activate sage
    export PI2_6_SAGE_LOADED="DONE"
else
    export MAMBA_EXE='/nas/home2/l/lperrin/miniforge3/bin/mamba';
    export MAMBA_ROOT_PREFIX='/nas/home2/l/lperrin/miniforge3';
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
    fi
    unset __mamba_setup

    mamba activate sage
    export PI2_6_SAGE_LOADED="DONE"
fi
