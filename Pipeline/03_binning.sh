
#!/bin/bash
#$ -l vf=120G
#$ -cwd
#$ -N cvd_bin1

metawrap binning -o /path to save Bins/XXX -t 10 -a /path to assembled contigs/final_assembly.fasta --metabat2 --maxbin2 --concoct /path to clean data/XXX*.fastq
