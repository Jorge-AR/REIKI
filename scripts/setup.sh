# thekoala -2014

# Create alias for horizontal line printing. This bit of cde was copied from:
# http://wiki.bash-hackers.org/snipplets/print_horizontal_line
# the command "eval $hr" is used to draw the line
hr="printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -"

# Other typsetting stuff via:
# http://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash
bold=`tput bold`
normal=`tput sgr0`
ul=`tput smul`
noul=`tput rmul`

# Define header(s) for verbose output
h1="${bold}[$(basename $0)]>>${normal} " # code reference: http://stackoverflow.com/questions/3362920/bash-script-get-just-filename-from-path
h2="             ... "

#
clear
clean=false
if [[ $@ == *clean* ]]; then 
  clean=true
fi
if ! $clean; then 	# note that $@ returns a string that contains all inputs; 
				# here we search for "clean" within this string
  echo
  eval $hr
  echo "${bold}Setup File for REIKI Project as well as the Koala toolkits.${normal}"
  script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
  echo "This script is located in \"${script_dir}\""
  echo "(by pilondon2@gmail.com, 2014)"
  eval $hr
  echo " "
  echo "The goals of this script are the following:"
  echo "  1. Create a hidden python directory in your home folder"
  echo "      for storing settings files and scripts."
  echo "  2. Download and install a startup file for interactive"
  echo "      pyhthon session."
  echo " "
  echo "  ${bold}${ul}NOTE${noul}:${normal} To ${bold}UNDO${normal} the effects of this script, run:"
  echo " "
  echo "     ${bold}sh setup.sh -clean${normal}"
  echo " "
else
  echo
  eval $hr
  echo "${bold}Now attempting to roll back setup ...${normal}"
  echo "This script is located in \"${script_dir}\""
fi

# NOTE for setting up Git with your GitHub account may be found here:
# (1) Setup    		https://help.github.com/articles/set-up-git
# (2) Repo Creation  	https://help.github.com/articles/create-a-repo
# (3) Other Guides	https://guides.github.com/

# -------------------------------------------------------------------------- #
# Set the interactive PYTHON Startup File
# -------------------------------------------------------------------------- #

# Define what will be the canonical location of our interactive python startup file
pyhome=~/.pyhome

# Let the user know that we're about to look for the above directory, and make it if it 
# does not already exist
eval $hr
echo $h1"Validating existence of \"$pyhome\" and the related interactive startup file."
if ! [ -a "$pyhome" ]; then

  if ! $clean; then
  
    echo $h2"Making \"$pyhome\""
    mkdir $pyhome
    # In this case, we need to download the startup file from the internet: Lionel's GitHub 
    # repository
    eval $hr
    echo $h1"Downloading the interactive startup file from the internet:"
    wget -P $pyhome https://raw.githubusercontent.com/llondon6/REIKI/master/scripts/interactive_startup.py
  
  else
  
    echo $h2"No directry at \"$pyhome\" to remove"
    
  fi
  
else # if the pyhome directory does exist, then determine whether the startup file is present

  if ! $clean; then
  
    echo ${bold}$h2"Directory \"$pyhome\" already exists."${normal}
    
    if [ -a $pyhome/interactive_startup.py ]; then
      echo ${bold}$h2"The interactive python file already exists, but will be downloaded anyway to ensure that it is up to date."${normal}
    fi
      # In this case, we need to download the startup file from the internet: Lionel's GitHub 
      # repository
      eval $hr
      echo $h1"Downloading the interactive startup file from the internet:"
      wget -P $pyhome https://raw.githubusercontent.com/llondon6/REIKI/master/scripts/interactive_startup.py
    
  else
  
    echo $h2"Removing \"$pyhome\" directory"
    rm -R $pyhome

  fi
  
fi
eval $hr

# Install the startup file that was downloaded above
path_line="$(grep "PYTHONSTARTUP" ~/.bashrc)"
if [ -z "$path_line" ]; then
  if ! $clean; then
    echo $h1"Setting the PYTHONSTARTUP system variable to \"$pyhome\" so that pyhton loads it when entering interactive mode."
    # Make backup file
    echo $h2"${bold}Saving${normal} back up \".bashrc\" file to \".bashrc.backup\""
    cp ~/.bashrc ~/.bashrc.backup
    # add a new line to the file that exports the PYTHONSTARTUP variable
    echo "export PYTHONSTARTUP=$pyhome/interactive_startup.py" >> ~/.bashrc
    # apply net startup variable
    echo $h2"${bold}Re-Sourcing${normal} the updated \".bashrc\" file."
    source ~/.bashrc
  fi
  eval $hr
else
  
  if ! $clean; then
  
    echo $h1"PYTHONSTARTUP is already set. Overwrite it? [Y/n]"
    read response
  
    if [ "$response" != "n" ]; then
      echo $h1"${bold}Proceeding${normal} to modify \".bashrc\" file."
      # Make backup file
      echo $h2"${bold}Saving${normal} back up \".bashrc\" file to \".bashrc.backup\""
      cp ~/.bashrc ~/.bashrc.backup
      # delete current PYTHONSTARTUP line in the bashrc file
      sed -i '/PYTHONSTARTUP=/d' ~/.bashrc # reference: http://stackoverflow.com/questions/5410757/sed-delete-a-line-containing-a-specific-string
      # write new line
      echo "export PYTHONSTARTUP=$pyhome/interactive_startup.py" >> ~/.bashrc
      # apply net startup variable
      echo $h2"${bold}Re-Sourcing${normal} the updated \".bashrc\" file."
      source ~/.bashrc
      # communicate with user
      echo $h2"${bold}Done${normal}: PYTHONSTARTUP system variable set to \"$pyhome\" so that pyhton loads it when entering interactive mode."
    fi
  
  else
  
    echo $h1"${bold}Proceeding${normal} to modify \".bashrc\" file."
    # Make backup file
    echo $h2"${bold}Saving${normal} back up \".bashrc\" file to \".bashrc.backup\""
    cp ~/.bashrc ~/.bashrc.backup
    # delete current PYTHONSTARTUP line in the bashrc file
    echo $h2"${bold}Warning: PYTHONSTART variable is being removed from \".bashrc\".${normal} You may wish to redefine it manually."
    sed -i '/PYTHONSTARTUP=/d' ~/.bashrc # reference: http://stackoverflow.com/questions/5410757/sed-delete-a-line-containing-a-specific-string
    # apply net startup variable
    echo $h2"${bold}Re-Sourcing${normal} the updated \".bashrc\" file."
    source ~/.bashrc
      
  fi
  
  eval $hr
  
fi


# -------------------------------------------------------------------------- #
# Verify the existence of the Analysis Toolkits
# -------------------------------------------------------------------------- #
dakit_list=$(locate DAKIT)
echo dakit_list=$dakit_list
reikit_list=$(locate reiki)
echo dakit_list=$dakit_list

# 
# # Store location of code library as BASH variable
# # -------------------------------------------------------------------------- #
# export REIKIPATH=~/projects/reiki/
# 
# # # Store this path to your .bashrc file so that it is loaded at every log-in
# # echo "export REIKIPATH=~/projects/reiki/" >> ~/.bashrc
# 
# # Ensure that useful libraries are installed
# # apt-get update
# # apt-get install python python-fftw python-sklearn* phython-scikit*

echo $h1"${bold}All Done!${normal}"
eval $hr