mkdir -p $VENV/bin
cat > $VENV/bin/activate <<EOF
# This file must be used with "source bin/activate" *from bash*
# you cannot run it directly

deactivate () {
    unset pydoc

    # reset old environment variables
    if [ -n "\$_OLD_VIRTUAL_PATH" ] ; then
        PATH="\$_OLD_VIRTUAL_PATH"
        export PATH
        unset _OLD_VIRTUAL_PATH
    fi
    if [ -n "\$_OLD_VIRTUAL_PYTHONHOME" ] ; then
        PYTHONHOME="\$_OLD_VIRTUAL_PYTHONHOME"
        export PYTHONHOME
        unset _OLD_VIRTUAL_PYTHONHOME
    fi

    unset GOROOT
    unset PYTHONPYCACHEPREFIX

    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the \$PATH changes we made may not be respected
    if [ -n "\$BASH" -o -n "\$ZSH_VERSION" ] ; then
        hash -r 2>/dev/null
    fi

    if [ -n "\$_OLD_VIRTUAL_PS1" ] ; then
        PS1="\$_OLD_VIRTUAL_PS1"
        export PS1
        unset _OLD_VIRTUAL_PS1
    fi

    if [ -n "\$_OLD_VIRTUAL_PYTHONPATH" ] ; then
        export PYTHONPATH="\$_OLD_VIRTUAL_PYTHONPATH"
        unset _OLD_VIRTUAL_PYTHONPATH
    fi

    if [ -n "\$_OLD_VIRTUAL_PYTHONSTARTUP" ] ; then
        export PYTHONSTARTUP="\$_OLD_VIRTUAL_PYTHONSTARTUP"
        unset _OLD_VIRTUAL_PYTHONSTARTUP
    fi

    unset VIRTUAL_ENV
    if [ ! "\$1" = "nondestructive" ] ; then
    # Self destruct!
        unset -f deactivate
    fi
}

# unset irrelevant variables
deactivate nondestructive

VIRTUAL_ENV="$VENV"
export VIRTUAL_ENV

_OLD_VIRTUAL_PATH="\$PATH"
PATH="\$VIRTUAL_ENV/bin:\$PATH"
if [ -e "\$VIRTUAL_ENV/opt/go" ]; then
PATH="\$PATH:\$VIRTUAL_ENV/opt/go/bin"
export GOROOT="\$VIRTUAL_ENV/opt/go"
fi
if [ -e "\$VIRTUAL_ENV/opt/mysql" ]; then
PATH="\$PATH:\$VIRTUAL_ENV/opt/mysql/bin"
fi
if [ -e "\$VIRTUAL_ENV/opt/mongodb" ]; then
PATH="\$VIRTUAL_ENV/opt/mongodb/bin:\$PATH"
fi
if [ -e "\$VIRTUAL_ENV/opt/google-cloud-sdk" ]; then
PATH="\$VIRTUAL_ENV/opt/google-cloud-sdk/bin:\$PATH"
fi
export PATH

export PYTHONPYCACHEPREFIX="/tmp/__\$(id -un)_pycache__"

_OLD_VIRTUAL_PYTHONPATH="\$PYTHONPATH"

if [ -f "\$HOME/.pythonstartup.py" ]; then
_OLD_VIRTUAL_PYTHONSTARTUP="\$PYTHONPATH"
export PYTHONSTARTUP=\$HOME/.pythonstartup.py
fi

# unset PYTHONHOME if set
# this will fail if PYTHONHOME is set to the empty string (which is bad anyway)
# could use \`if (set -u; : \$PYTHONHOME) ;\` in bash
if [ -n "\$PYTHONHOME" ] ; then
    _OLD_VIRTUAL_PYTHONHOME="\$PYTHONHOME"
    unset PYTHONHOME
fi

if [ -z "\$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
    _OLD_VIRTUAL_PS1="\$PS1"
    if [ "x" != x ] ; then
        PS1="\$PS1"
    else
        PS1="(\`basename \\"\$VIRTUAL_ENV\\"\`)\$PS1"
    fi
    export PS1
fi

alias pydoc="python -m pydoc"

# This should detect bash and zsh, which have a hash command that must
# be called to get it to forget past commands.  Without forgetting
# past commands the \$PATH changes we made may not be respected
if [ -n "\$BASH" -o -n "\$ZSH_VERSION" ] ; then
    hash -r 2>/dev/null
fi
EOF
