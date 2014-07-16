
#
echo "% ------------------------------------------------------- %"
echo " Setup File for REIKI Project Code Base (2014)"
echo " "
echo " The goals of this script are the following:"
echo "   1. Create enviromental vaibles for libraries."
echo "   2. Verify that needed python libraries are installed."
echo "% ------------------------------------------------------- %"
# thekoala -2014
clear

# NOTE for setting up Git with your GitHub account may be found here:
# (1) Setup    		https://help.github.com/articles/set-up-git
# (2) Repo Creation  	https://help.github.com/articles/create-a-repo
# (3) Other Guides	https://guides.github.com/

# Set the interactive PYTHON Startup File
# -------------------------------------------------------------------------- #
# NOTE: This file should be uploaded to an open repository, and 
# a wget command should be added below to obtain the file.
pyhome=~/.pyhome
echo "Validating existence of \"$pyhome\" and the related interactive startup file ..."
if ! [ -a $pyhome ]; then
  echo "Making \"$pyhome\" ..."
  mkdir $pyhome
fi
wget -P $pyhome https://raw.githubusercontent.com/llondon6/REIKI/master/scripts/interactive_startup.py

path_line=grep "PYTHON" .bashrc
if [ -z $pathline ]; then
  echo "Setting the PYTHONSTARTUP system variable to \"$pyhome\" so that pyhton loads it when entering interactive mode..."
  echo "export PYTHONSTARTUP=$pyhome.interactive_startup.py" >> ~/.bashrc
else
  echo "PYTHONSTARTUP is already set to $pyhome"
fi

# Store location of code library as BASH variable
# -------------------------------------------------------------------------- #
export REIKIPATH=~/projects/reiki/

# # Store this path to your .bashrc file so that it is loaded at every log-in
# echo "export REIKIPATH=~/projects/reiki/" >> ~/.bashrc

# Ensure that useful libraries are installed
# apt-get update
# apt-get install python python-fftw python-sklearn* phython-scikit*
