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
    unset AIRFLOW_HOME
    unset NODE_PATH
    unset SSL_CERT_FILE

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
if [ -e "\$VIRTUAL_ENV/go" ]; then
PATH="\$PATH:\$VIRTUAL_ENV/go/bin"
export GOROOT="\$VIRTUAL_ENV/go"
fi
if [ -e "\$VIRTUAL_ENV/mysql" ]; then
PATH="\$PATH:\$VIRTUAL_ENV/mysql/bin"
fi
export PATH

export AIRFLOW_HOME="/data/airflow"
export NODE_PATH="\$VIRTUAL_ENV/lib/node_modules"
if [ "\$(uname)" == "Darwin" ]; then
export SSL_CERT_FILE="\$VIRTUAL_ENV/lib/python2.7/site-packages/certifi/cacert.pem"
fi

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
