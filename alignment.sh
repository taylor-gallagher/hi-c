#!/bin/bash
#SBATCH --job-name=bwa_alignment
#SBATCH --cpus-per-task=64
#SBATCH --mem=300GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

bwa mem -5SP -T0 -t16 /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/final_assembly.fasta <(zcat /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1081_R1.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1082_R1.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1217_CKDL250023424-1A_22WVTGLT4_L4_1.fq.gz) <(zcat /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1081_R2.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1082_R2.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1217_CKDL250023424-1A_22WVTGLT4_L4_2.fq.gz) \
	-o vw.aligned.sam
