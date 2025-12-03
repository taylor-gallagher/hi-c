#!/bin/bash
#SBATCH --job-name=pairtools_parse
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

pairtools parse --min-mapq 40 --walks-policy 5unique --max-inter-align-gap 30 --nproc-in 32 --nproc-out 32 --chroms-path vw.genome --output vw.parsed.pairsam.gz vw.aligned.sam
