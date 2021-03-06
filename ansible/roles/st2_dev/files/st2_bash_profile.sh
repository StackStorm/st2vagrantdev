#!/usr/bin/env bash

PRINT_INFO=${PRINT_INFO:-"1"}
ST2_SHARE_DIR="/home/vagrant/st2"

PYTHON_BINARY_FILE_PATH="/home/vagrant/.st2_python_binary"
DISTRO_NAME=$(lsb_release -c | awk '{print $2}')

if [ ! -f "${PYTHON_BINARY_FILE_PATH}" ]; then
    >&2 echo "${PYTHON_BINARY_FILE_PATH} file doesn't exist. Make sure you ran vagrant provision"
    return 0
fi

PYTHON_BINARY=$(cat ${PYTHON_BINARY_FILE_PATH})
PYTHON_BINARY_NAME=$(echo "${PYTHON_BINARY}" | sed "s#/usr/bin/##g")

export PYTHON_VERSION=${PYTHON_BINARY_NAME}

PYTHON_VERSION_SHORT_STRING=$(${PYTHON_BINARY} --version | sed "s/Python //g" | sed "s/\.//g" | tr -d "\n")

export VIRTUALENV_DIR=virtualenv-${DISTRO_NAME}-py${PYTHON_VERSION_SHORT_STRING}
export VIRTUALENV_ST2CLIENT_DIR=virtualenv-st2client-${DISTRO_NAME}-py${PYTHON_VERSION_SHORT_STRING}
export VIRTUALENV_COMPONENTS_DIR=virtualenv-components-${DISTRO_NAME}-py${PYTHON_VERSION_SHORT_STRING}

if [ "${PRINT_INFO}" = "1" ]; then
    echo ""
    echo "Using Python 3 binary for make targets: ${PYTHON_BINARY} (${PYTHON_VERSION})"
    echo ""
    echo "VIRTUALENV_DIR=${VIRTUALENV_DIR}"
    echo "VIRTUALENV_ST2CLIENT_DIR=${VIRTUALENV_ST2CLIENT_DIR}"
    echo "VIRTUALENV_COMPONENTS_DIR=${VIRTUALENV_COMPONENTS_DIR}"
    echo ""
fi

if [ -d "${ST2_SHARE_DIR}" ]; then
    cd "${ST2_SHARE_DIR}"

    if [ -f "${VIRTUALENV_DIR}/bin/activate" ]; then
        source "${VIRTUALENV_DIR}/bin/activate"
    else
        >&2 echo "${ST2_SHARE_DIR}/${VIRTUALENV_DIR} directory doesn't exist."
        >&2 echo "You should go to ~/st2 and run make requirements to create virtualenv"
    fi
fi
