#!/bin/bash
# Install Anaconda
wget http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh  # check version
bash Anaconda2-4.0.0-Linux-x86_64.sh # need manual "yes" responses
rm Anaconda2-4.0.0-Linux-x86_64.sh
source ~/.bashrc

# Install depencies
conda install numpy setuptools numpy scipy matplotlib nose mayavi pandas h5py pil patsy pyside joblib
pip install nibabel
pip install git+https://github.com/scikit-learn/scikit-learn
pip install git+https://github.com/mne-tools/mne-python
pip install git+https://github.com/mne-tools/mne-sandbox
pip install git+https://github.com/dengemann/meeg-preprocessing
pip install git+https://github.com/alexandrebarachant/pyRiemann
pip install git+https://github.com/kingjr/jr-tools

# Add working projects
git clone https://github.com/kingjr/valentin-eeg
git clone https://github.com/kingjr/decoding_unconscious_maintenance
git clone https://github.com/kingjr/meg_perceptual_decision_symbols

# Setup ipython profile
ipython profile create
echo "import matplotlib; matplotlib.use('Agg')" > ~/.ipython/profile_default/ipython_config.py

# Setup jupyter notebook
PASSWD=$(ipython -c "import IPython;pwd=IPython.lib.passwd();print(pwd)")
jupyter notebook --generate-config
cp ~/aws/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'$PASSWD'" > ~/.jupyter/jupyter_notebook_config.py
