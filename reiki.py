#! /usr/bin/env python

"""
This is to be the primary code package for the package previously know as "joki".
@package reiki
"""

import scipy
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import time

# Start timer to keep track of run speed: grab the curren time
start_time = time.time()

# ------------------------------------------------------------------------------ #
# Game1: Simulate simple harmonic motion. The goals are to perform the numerical 
# integrations, plot the data in real time, and save the data and final plots.
# ------------------------------------------------------------------------------ #

#
# Let's think of this experiment as a particle rolling without slipping in a parabolic well.
#


x1 = np.linspace(0.0, 5.0,120)
x2 = np.linspace(0.0, 2.0)

y1 = np.cos(2 * np.pi * x1) * np.exp(-x1)
y2 = np.cos(2 * np.pi * x2)

plt.subplot(2, 1, 1)
plt.plot(x1, y1, 'yo-')
plt.title('A tale of 2 subplots')
plt.ylabel('Damped oscillation')

plt.subplot(2, 1, 2)
plt.plot(x2, y2, 'r.-')
plt.xlabel('time (s)')
plt.ylabel('Undamped')

matplotlib.figure.Figure('facecolor',[1,1,1])

plt.show()

# Subtract the start time from the current time to estimate run speed
run_time = time.time() - start_time
print('Time Elapsed: {:.5} sec'.format(run_time))