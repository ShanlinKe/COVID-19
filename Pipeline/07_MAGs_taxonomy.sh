#!/bin/bash
#$ -l vf=200G
#$ -cwd
#$ -N cvd_gtdb

gtdbtk classify_wf --cpus 4 --genome_dir /path to MAGs/Bins_50_5 --out_dir /path to save data/gtdb --extension fa
