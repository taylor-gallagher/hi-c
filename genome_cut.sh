#!/bin/bash
#SBATCH --job-name=genome_cut
#SBATCH --cpus-per-task=4
#SBATCH --mem=50GB
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

cut -f1,2 /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/final_assembly.fasta.fai > vw.genome
