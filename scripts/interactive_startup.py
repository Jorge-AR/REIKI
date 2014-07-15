#! /usr/bin/env python
# ~llondon6'14

print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

#
import os

#
print('>> Running the custom startup script.')
print('.... This script is located in \"'+os.path.dirname(os.path.realpath(__file__))+'\".')
print(".... Importing os.")

#
print(".... Importing numpy.")
import numpy

#
print(".... Importing scipy.")
import scipy

#
print(".... Importing matplotlib.")
import matplotlib

#
print(".... Importing JOKI.")
import JOKI

#
print(".... Turning on interactive plotting.")
from matplotlib import interactive
interactive(True)

#
print(">> All Done! :-)")

print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
