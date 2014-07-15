
#
echo "% ------------------------------------------------------- %"
echo " Setup File for REIKI Project Code Base (2014)"
echo " "
echo " The goals of this script are the following:"
echo "   1. Create enviromental vaibles for libraries."
echo "   2. Verify that needed python libraries are installed."
echo "% ------------------------------------------------------- %"

# NOTE for setting up Git with your GitHub account may be found here:
# (1) Setup    		https://help.github.com/articles/set-up-git
# (2) Repo Creation  	https://help.github.com/articles/create-a-repo

# Set the interactive PYTHON Startup File
# -------------------------------------------------------------------------- #
# NOTE: This file should be uploaded to an open repository, and 
# a wget command should be added below to obtain the file.
export PYTHONSTARTUP=~/JOKI/python/startup.py

# Store location of code library as BASH variable
# -------------------------------------------------------------------------- #
export REIKIPATH=~/projects/reiki/

# # Store this path to your .bashrc file so that it is loaded at every log-in
# echo "export REIKIPATH=~/projects/reiki/" >> ~/.bashrc

# Ensure that useful libraries are installed
# apt-get update
# apt-get install python python-fftw python-sklearn* phython-scikit*
