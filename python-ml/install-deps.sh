#! /bin/bash

set -eo pipefail

apt-get update
apt-get install -y python3-zmq \
                   python3-dateutil \
                   python3-tz

pip3 install --upgrade pip
pip3 install numpy
pip3 install scipy
pip3 install pandas
pip3 install scikit-learn

# Clean up
rm -rf /var/lib/apt/lists/*
rm "$0"
