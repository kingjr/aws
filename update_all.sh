#!/bin/bash
# ensure env variables
echo 'export aws=True' >> /home/ubuntu/.bashrc
source /home/ubuntu/.bashrc

echo  'import os' >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "os.environ['aws'] = 'True'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

# Update all
conda update numpy setuptools numpy scipy matplotlib nose mayavi pandas h5py pil patsy pyside joblib dropbox -y
pip install nibabel --upgrade

cd /home/ubuntu/scikit-learn; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/mne-python; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/mne-sandbox; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/meeg-preprocessing; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/pyRiemann; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/h5io; git pull origin master; cd /home/ubuntu/

cd /home/ubuntu/valentin-eeg; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/decoding_unconscious_maintenance; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/meg_perceptual_decision_symbols; git pull origin master; cd /home/ubuntu/

# Automatic notebook server at startup
nohup jupyter notebook &
