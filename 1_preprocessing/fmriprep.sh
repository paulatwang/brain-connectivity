#!/bin/sh
#SBATCH --job-name=fmriprep      
#SBATCH --partition=mnl-all
#SBATCH --exclude=easley,nash,turing,wood,babbage
#SBATCH --array=1-35
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=paulawang@ucsb.edu
#SBATCH --ntasks-per-node=1     # number of tasks per node
#SBATCH --mem-per-cpu=4G
#SBATCH -o /home/pw/projects/thesis/code/1_preprocessing/slurm_logs/%x-%A-%a.out
#SBATCH -e /home/pw/projects/thesis/code/1_preprocessing/slurm_logs/%x-%A-%a.err

# Parse the participants.tsv file and extract one subject ID from the line corresponding to this SLURM task.                                                                                           
SUB="$(sed -n "$((${SLURM_ARRAY_TASK_ID} + 1))s/sub-\(\S*\)\>.*/\1/gp" /home/pw/projects/thesis/data/bids/participants.tsv)"

# Docker command
cmd="docker run --privileged=true --rm --tty \
-v /srv/scratch/pw/data/ncof2/:/base:ro \
-v /srv/scratch/pw/data/ncof2/derivatives:/out \
-v /home/pw/projects/thesis/code/1_preprocessing/license.txt:/opt/freesurfer/license.txt:ro \
nipreps/fmriprep:22.0.0 /base/ /out/ \
participant \
--participant-label "${SUB}" \
--output-spaces MNI152NLin6Asym \
--ignore fieldmaps \
--fs-no-reconall \
--resource-monitor \
--nthreads 4 \
--omp-nthreads 6 \
--mem-mb 25000 \
--write-graph"

# Setup done, run the command
echo "PATH=$PATH"
echo "SHELL=$SHELL"
echo Running job: ${SLURM_ARRAY_JOB_ID}
echo Running task: ${SLURM_ARRAY_TASK_ID}
echo Running subject: $SUB
echo Commandline: $cmd
echo Executing on the machine: $(hostname)

eval $cmd
