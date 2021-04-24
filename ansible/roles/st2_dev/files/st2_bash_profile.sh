#!/usr/bin/env bash
PYTHON_VERSION=$(python3 --version | sed "s/Python //g" | sed "s/\.//g" | tr -d "\n")

export VIRTUALENV_DIR=virtualenv-py${PYTHON_VERSION}
export VIRTUALENV_ST2CLIENT_DIR=virtualenv-st2client-py${PYTHON_VERSION}
export VIRTUALENV_COMPONENTS_DIR=virtualenv-components-py${PYTHON_VERSION}

if [ -d "~/st2" ]; then
    cd ~/st2

    if [ -f "virtualenv-py${PYTHON_VERSION}/bin/activate" ]; then
        source "virtualenv-py${PYTHON_VERSION}/bin/activate"
    fi
fi
