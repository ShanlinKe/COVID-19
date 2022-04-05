#!/bin/bash
#$ -l vf=120G
#$ -cwd
#$ -N cvd_ref1

metawrap bin_refinement -o /path to save dta/XXX -t 24 -A /path to bins /metabat2_bins/ -B /path to bins/maxbin2_bins/ -C /path to bins /concoct_bins/ -c 50 -x 10
