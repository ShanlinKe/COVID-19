#!/bin/bash
#$ -l vf=160G
#$ -cwd
#$ -N cov-assm11

metawrap assembly -1 /path to clean data/XXX_1.fastq -2 /path to clean data/XXX_2.fastq -m 200 -t 20 --metaspades -o /path to save data/XXX
