# PolarCodes
Matlab implementation of polar codes for a binnary erasure channel

## Table of Contents :
  * [About](#about)
  * [Setup](#setup)
  * [Configuration](#configuration)

## About ##

Simple implementation of polar codes - coding and decoding - for binnary erasure channels.

## Setup

The code runs entirely in Matlab. The `main.m` file runs the entire simulation, namely it runs a simulation for several bit rates and plot the block error probaility for them.

### Configuration 

Each individual file apart from the `main.m` file can be used as a standalone function, and hence also be configured individually.
In the `main.m` file there is the possibility to change the block size, the channel erasure probability, the number of simulations as well as the number of rates to be simulated.
