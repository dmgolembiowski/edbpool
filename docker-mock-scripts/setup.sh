#!/bin/bash

echo -e "\e[30;48;5;82mEDBPool E-Z Setup\e[0m"
echo -e "\e[40;38;5;82mBeginning RPC/Reverse Shell Pipeline:"

cd /home/edbpool/edbpool \
    && /bin/bash docker-mock-scripts/phase_1/pyenv_installer.sh \
    && source ~/.bashrc \
    && export PYENV_ROOT=$PYENV_ROOT \
    && export PATH=$PATH:$PYENV_ROOT/bin \
    && eval "$(pyenv init -)" \
    && export -f pyenv \
    && pyenv install 3.8-dev \
    && pyenv shell 3.8-dev \
    && python3 -m venv . \
    && source bin/activate \
    && pip install -U pip wheel \
    && pip install -r dev-requirements.txt \
    && python3 docker-mock-scripts/phase_1/rpcserver.py "docker-mock-scripts/config.json"

