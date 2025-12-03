#!/bin/bash
#SBATCH --job-name=fastq_to_pairs
#SBATCH --cpus-per-task=64
#SBATCH --mem=500GB
#SBATCH --nodes=1
#SBATCH --time=7-00:00:00
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --partition=aoraki

source ~/miniforge3/bin/activate
conda activate omni-c

bwa mem -5 -S -P -T0 -t16 /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/final_assembly.fasta \
	<(zcat /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1081_R1.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1082_R1.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1217_CKDL250023424-1A_22WVTGLT4_L4_1.fq.gz) \
	<(zcat /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1081_R2.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1082_R2.fastq.gz /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/DTG_OmniC_1217_CKDL250023424-1A_22WVTGLT4_L4_2.fq.gz) \
	 pairtools parse --min-mapq 40 --walks-policy 5unique --max-inter-align-gap 30 --nproc-in 8 --nproc-out 8 \
	--chroms-path /weka/health_sciences/bms/biochemistry/dearden_lab/galta815/hi-c/vw.genome | \
	 pairtools sort --tmpdir =/weka/health_sciences/bms/biochemistry/dearden_lab/galta815/tmp/ --nproc 16 | \
	 pairtools dedup --nproc-in 8 --nproc-out 8 --mark-dups --output-stats vw_stats.txt | \
	 pairtools split --nproc-in 8 --nproc-out 8 --output-pairs vw_mapped.pairs --output-sam - | \
	 samtools view -bS -@16 | \
	 samtools sort -@16 -o vw.mapped.PT.bam;samtools index vw.mapped.PT.bam
