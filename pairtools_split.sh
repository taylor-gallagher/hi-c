#!/bin/bash
#SBATCH --job-name=pairtools_split
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

pairtools split --nproc-in 8 --nproc-out 8 --output-pairs vw.mapped.pairs --output-sam vw.unsorted.bam vw.dedup.pairsam
