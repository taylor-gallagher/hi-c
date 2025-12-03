#!/bin/bash
#SBATCH --job-name=samtools_sort
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

samtools sort -@16 -T /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/tmp -o vw.mapped.PT.bam vw.unsorted.bam

