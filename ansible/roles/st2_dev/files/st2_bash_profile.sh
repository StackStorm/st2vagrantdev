#!/usr/bin/env bash
PYTHON_BINARY=$(cat /home/vagrant/.st2_python_binary)
export PYTHON_VERSION=$(echo ${PYTHON_BINARY} | sed "s#/usr/bin/##g")

PYTHON_VERSION_STRING=$(${PYTHON_BINARY} --version | sed "s/Python //g" | sed "s/\.//g" | tr -d "\n")

export VIRTUALENV_DIR=virtualenv-py${PYTHON_VERSION}
export VIRTUALENV_ST2CLIENT_DIR=virtualenv-st2client-py${PYTHON_VERSION}
export VIRTUALENV_COMPONENTS_DIR=virtualenv-components-py${PYTHON_VERSION}

echo ""
echo "Using Python 3 binary for Make targets: ${PYTHON_BINARY} (${PYTHON_VERSION})"
echo "VIRTUALENV_DIR=${VIRTUALENV_DIR}"
echo "VIRTUALENV_ST2CLIENT_DIR=${VIRTUALENV_ST2CLIENT_DIR}"
echo "VIRTUALENV_COMPONENTS_DIR=${VIRTUALENV_COMPONENTS_DIR}"

if [ -d "~/st2" ]; then
    cd ~/st2

    if [ -f "virtualenv-py${PYTHON_VERSION}/bin/activate" ]; then
        source "virtualenv-py${PYTHON_VERSION}/bin/activate"
    fi
fi
