#!/bin/bash
#$ -l vf=200G
#$ -cwd
#$ -N hmn1_1

humann --input /proj/spteds/spted00/Project/Covid_19/function/HUMANN3/clean1/SRR12328899.fa --threads 10 --output /proj/spteds/spted00/Project/Covid_19/function/HUMANN3/humann1