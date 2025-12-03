#!/bin/bash
#SBATCH --job-name=expanded_standard_pairsam
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

awk 'NR>5 {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10}' vw.sorted.pairsam >> vw.standard.pairsam
