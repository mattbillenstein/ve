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
#    unset PYTHONPATH

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
export PATH

export AIRFLOW_HOME="/data/airflow"
export NODE_PATH="\$VIRTUAL_ENV/lib/node_modules"
#export PYTHONPATH="/foo/bar"

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

cat > $VENV/bin/activate.fish <<EOF
# This file must be used using ". bin/activate.fish" *within a running fish ( http://fishshell.com ) session*.
# Do not run it directly.

function deactivate -d 'Exit virtualenv mode and return to the normal environment.'
    # reset old environment variables
    if test -n "\$_OLD_VIRTUAL_PATH"
        set -gx PATH \$_OLD_VIRTUAL_PATH
        set -e _OLD_VIRTUAL_PATH
    end

    if test -n "\$_OLD_VIRTUAL_PYTHONHOME"
        set -gx PYTHONHOME \$_OLD_VIRTUAL_PYTHONHOME
        set -e _OLD_VIRTUAL_PYTHONHOME
    end

    if test -n "\$_OLD_FISH_PROMPT_OVERRIDE"
        # Set an empty local "\$fish_function_path" to allow the removal of "fish_prompt" using "functions -e".
        set -l fish_function_path

        # Erase virtualenv's "fish_prompt" and restore the original.
        functions -e fish_prompt
        functions -c _old_fish_prompt fish_prompt
        functions -e _old_fish_prompt
        set -e _OLD_FISH_PROMPT_OVERRIDE
    end

    set -e VIRTUAL_ENV

    set -e GOROOT
    set -e AIRFLOW_HOME
    set -e NODE_PATH
#    set -e PYTHONPATH

    if test "\$argv[1]" != 'nondestructive'
        # Self-destruct!
        functions -e pydoc
        functions -e deactivate
    end
end

# Unset irrelevant variables.
deactivate nondestructive

set -gx VIRTUAL_ENV "\$VIRTUAL_ENV"

set -gx _OLD_VIRTUAL_PATH \$PATH
set -gx PATH "\$VIRTUAL_ENV/bin" \$PATH
set -gx PATH "\$VIRTUAL_ENV//opt/go/bin" \$PATH

set -gx AIRFLOW_HOME "/data/airflow"
set -gx NODE_PATH "\$VIRTUAL_ENV/lib/node_modules"
#set -gx PYTHONPATH "/foo/bar"

# Unset "\$PYTHONHOME" if set.
if set -q PYTHONHOME
    set -gx _OLD_VIRTUAL_PYTHONHOME \$PYTHONHOME
    set -e PYTHONHOME
end

function pydoc
    python -m pydoc \$argv
end

if test -z "\$VIRTUAL_ENV_DISABLE_PROMPT"
    # Copy the current "fish_prompt" function as "_old_fish_prompt".
    functions -c fish_prompt _old_fish_prompt

    function fish_prompt
        # Save the current \$status, for fish_prompts that display it.
        set -l old_status \$status

        # Prompt override provided?
        # If not, just prepend the environment name.
        if test -n ""
            printf '%s%s' "" (set_color normal)
        else
            printf '%s(%s) ' (set_color normal) (basename "\$VIRTUAL_ENV")
        end

        # Restore the original \$status
        echo "exit \$old_status" | source
        _old_fish_prompt
    end

    set -gx _OLD_FISH_PROMPT_OVERRIDE "\$VIRTUAL_ENV"
end
EOF
