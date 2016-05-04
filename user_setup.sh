#!/bin/bash
# Install depencies
conda install numpy setuptools numpy scipy matplotlib nose mayavi pandas h5py pil patsy pyside joblib dropbox
pip install nibabel
pip install git+https://github.com/scikit-learn/scikit-learn --force-reinstall
pip install git+https://github.com/mne-tools/mne-python --force-reinstall
pip install git+https://github.com/mne-tools/mne-sandbox --force-reinstall
pip install git+https://github.com/dengemann/meeg-preprocessing --force-reinstall
pip install git+https://github.com/alexandrebarachant/pyRiemann --force-reinstall
pip install git+https://github.com/kingjr/jr-tools --force-reinstall
pip install git+https://github.com/h5io/h5io --force-reinstall

# Add working projects
git clone https://github.com/kingjr/valentin-eeg
git clone https://github.com/kingjr/decoding_unconscious_maintenance
git clone https://github.com/kingjr/meg_perceptual_decision_symbols

# Setup ipython profile
ipython profile create
echo "import matplotlib; matplotlib.use('Agg')" >> /home/ubuntu/.ipython/profile_default/ipython_config.py

# Setup .bashrc
echo 'export aws=True' >> /home/ubuntu/.bashrc
source /home/ubuntu/.bashrc

# Setup jupyter notebook
PASSWD=$(ipython -c "import IPython;pwd=IPython.lib.passwd();print(pwd)")
jupyter notebook --generate-config -y
cp /home/ubuntu/aws/jupyter_notebook_config.py /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'$PASSWD'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
