#!/bin/bash

# Name of the Conda environment
ENV_NAME="Memonet-test"

# URL of the Git repository
REPO_URL="https://github.com/finetceline/MemoNet"

# Directory name after cloning
REPO_DIR="Memonet-test"

# Creating the Conda environment
echo "Creating Conda environment: $ENV_NAME"
conda create -n $ENV_NAME python=3.7.9 -y

# Activating the environment
echo "Activating Conda environment: $ENV_NAME"
source $(conda info --base)/etc/profile.d/conda.sh
conda activate $ENV_NAME

# Cloning the Git repository
echo "Cloning Git repository: $REPO_URL"
git clone $REPO_URL

# Installing pytorch and dependencies from requirements.txt
echo "Installing pytorch and dependencies from requirements.txt"
cd $REPO_DIR
conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch
pip install -r requirements.txt

# End of script
echo "Setup complete. The environment is ready."
