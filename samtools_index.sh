#!/bin/bash
#SBATCH --job-name=samtools_index_end
#SBATCH --cpus-per-task=64
#SBATCH --mem=200GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

samtools index -c vw.mapped.PT.bam
