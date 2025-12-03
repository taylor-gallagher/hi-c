#!/bin/bash
#SBATCH --job-name=hiccups
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:1
#SBATCH --mem=150GB
#SBATCH --nodes=1
#SBATCH --time=2-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki_gpu

source ~/miniforge3/bin/activate
conda activate omni-c
module load cuda

java -jar juicertools.jar hiccups -m 500 -r 10000,25000,50000,100000 -k KR --threads 16 --ignore-sparsity /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/contact_map.hic \
	/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/hiccups_results
