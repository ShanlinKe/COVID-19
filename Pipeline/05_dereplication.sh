#!/bin/bash
#$ -l vf=300G
#$ -cwd
#$ -N cvd_drep

dRep dereplicate /path to save data/drep -g /path to bins/*.fa -sa 0.99 -pa 0.9 -nc 0.30 -p 20 -d -comp 50 -con 5
