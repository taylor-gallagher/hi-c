#!/bin/bash
#SBATCH --job-name=samtools
#SBATCH --cpus-per-task=32
#SBATCH --mem=200GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

samtools faidx /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/final_assembly.fasta
