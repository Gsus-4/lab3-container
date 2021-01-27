#!/bin/bash
# NOTE:
# --cpus-per-task parameter controls the number of
# cpus needed to run the current job.
#
# If your application runs sequentially, please set
# --cpus-per-task=1
# If you need to reserve the full node, please set
# --cpus-per-task=26

#SBATCH -p hpc-bio-lejeune
#SBATCH --chdir=/home/alumno20/lab3-container
#SBATCH -J eval_sing
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=jesus.vicentem@um.es

module load singularity

singularity exec ./singularity/python_latest.sif python --version
echo

echo "Tiempo para la ejecución de kmer-13 en c++:"
time singularity exec ./singularity/python_latest.sif ./data/k-mer13
echo

echo "Tiempo para la ejecución de kmer-14 en c++:"
time singularity exec ./singularity/python_latest.sif ./data/k-mer14
echo

echo "Tiempo para la ejecución de kmer-8 en python:"
time singularity exec ./singularity/python_latest.sif python ./data/k-mer8.py
echo

echo "Tiempo para la ejecución de kmer-13 en python:"
time singularity exec ./singularity/python_latest.sif python ./data/k-mer13.py
echo

echo "Tiempo para la ejecución de kmer-14 en python:"
time singularity exec ./singularity/python_latest.sif python ./data/k-mer14.py

