#!/bin/bash
#SBATCH --job-name=pairtools_sort
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

pairtools sort --nproc 64 --tmpdir=/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/tmp --compress-program gzip vw.parsed.pairsam.gz > vw.sorted.pairsam.gz

