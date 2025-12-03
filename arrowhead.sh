#!/bin/bash
#SBATCH --job-name=arrowhead_lower_res
#SBATCH --cpus-per-task=64
#SBATCH --mem=700GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki_fastcore

source ~/miniforge3/bin/activate
conda activate omni-c

java -jar juicertools.jar arrowhead /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/contact_map.hic --threads 64 -r 100000 -k KR --ignore-sparsity \
	/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/arrowhead_tads_lowerres.txt
