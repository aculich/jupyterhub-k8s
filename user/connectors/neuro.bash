#!/bin/bash
# conda & pip packages for neuro connector (mark.lescroart)

${CONDA_DIR}/bin/pip --no-cache-dir install \
    lxml==3.7.2 \ # For pycortex
    mne==0.13.1 \ # For neurods
    tqdm==4.11.2 \ # For neurods
    boto3==1.4.4 \ # For cottoncandy
    pydrive==1.3.1 \ # For cottoncandy
    ;

${CONDA_DIR}/bin/conda install --quiet --yes \
    nibabel==2.1.0 \
    ;

# pycortex can't be installed from the repository at the moment
# ${CONDA_DIR}/bin/pip install git+https://github.com/gallantlab/pycortex@data8

# Installs the cortex library
git clone https://github.com/gallantlab/pycortex
cd pycortex
# commit on data8 branch
git checkout d570713
${CONDA_DIR}/bin/python setup.py install
cd ..