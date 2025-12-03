#!/bin/bash
#SBATCH --job-name=pairs_to_hic
#SBATCH --cpus-per-task=64
#SBATCH --mem=700GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki_fastcore

source ~/miniforge3/bin/activate
conda activate omni-c

java -Xmx7168000m -Djava.awt.headless=true -jar juicertools.jar pre --threads 64 \
	/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/vw.mapped.pairs \
	/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/contact_map.hic \
	/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/analysis/vw.genome
