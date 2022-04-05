#!/bin/bash
#$ -l vf=200G
#$ -cwd
#$ -N cvd_ann

metaWRAP annotate_bins -o /path to save data/function -t 4 -b /path to MAGs/dereplicated_genomes


####### microbeannotator use the predicted protein sequences for downstream analysis
#!/bin/bash
#$ -l vf=250G
#$ -cwd
#$ -N cvd_ann

microbeannotator -i /path to proteins/*.faa -d /path to microbeannotator database/database -o /path to save data/functions -m diamond -p 5 -t 4 --refine
