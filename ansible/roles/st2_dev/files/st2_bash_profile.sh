#!/usr/bin/env bash

PYTHON_BINARY_FILE_PATH="/home/vagrant/.st2_python_binary"

if [ ! -f "${PYTHON_BINARY_FILE_PATH}" ]; then
    echo "${PYTHON_BINARY_FILE_PATH} file doesn't exist. Make sure you ran vagrant provision"
fi

PYTHON_BINARY=$(cat ${PYTHON_BINARY_FILE_PATH})
export PYTHON_VERSION=$(echo "${PYTHON_BINARY}" | sed "s#/usr/bin/##g")

PYTHON_VERSION_SHORT_STRING=$(${PYTHON_BINARY} --version | sed "s/Python //g" | sed "s/\.//g" | tr -d "\n")

export VIRTUALENV_DIR=virtualenv-py${PYTHON_VERSION_SHORT_STRING}
export VIRTUALENV_ST2CLIENT_DIR=virtualenv-st2client-py${PYTHON_VERSION_SHORT_STRING}
export VIRTUALENV_COMPONENTS_DIR=virtualenv-components-py${PYTHON_VERSION_SHORT_STRING}

echo ""
echo "Using Python 3 binary for Make targets: ${PYTHON_BINARY} (${PYTHON_VERSION})"
echo ""
echo "VIRTUALENV_DIR=${VIRTUALENV_DIR}"
echo "VIRTUALENV_ST2CLIENT_DIR=${VIRTUALENV_ST2CLIENT_DIR}"
echo "VIRTUALENV_COMPONENTS_DIR=${VIRTUALENV_COMPONENTS_DIR}"
echo ""

if [ -d "/home/vagrant/st2" ]; then
    cd /home/vagrant/st2

    if [ -f "${VIRTUALENV_DIR}/bin/activate" ]; then
        source "${VIRTUALENV_DIR}/bin/activate"
    fi
fi
