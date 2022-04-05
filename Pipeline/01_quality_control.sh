#!/bin/bash
#$ -l vf=100G
#$ -cwd
#$ -N QC_covid1

metawrap read_qc -1 /path to sequencing data/XXX_1.fastq -2 /path to sequencing data/XXX_2.fastq -t 10 -o /path of saving data/XXX
