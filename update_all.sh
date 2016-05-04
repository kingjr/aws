#!/bin/bash
# Update all
conda update numpy setuptools numpy scipy matplotlib nose mayavi pandas h5py pil patsy pyside joblib dropbox -y
pip install nibabel --upgrade

cd /home/ubuntu/scikit-learn; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/mne-python; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/mne-sandbox; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/meeg-preprocessing; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/pyRiemann; git pull origin master; cd /home/ubuntu/

cd /home/ubuntu/valentin-eeg; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/decoding_unconscious_maintenance; git pull origin master; cd /home/ubuntu/
cd /home/ubuntu/meg_perceptual_decision_symbols; git pull origin master; cd /home/ubuntu/

# Automatic notebook server at startup
nohup jupyter notebook &
