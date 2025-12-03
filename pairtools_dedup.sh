#!/bin/bash
#SBATCH --job-name=pairtools_dedup
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

pairtools dedup --nproc-in 32 --nproc-out 32 --mark-dups --output-stats vw.dedup.txt --output vw.dedup.pairsam vw.sorted.pairsam
