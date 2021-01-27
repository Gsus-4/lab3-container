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
#SBATCH -J evaluacion_nativa
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=jesus.vicentem@um.es

echo "Tiempo para la ejecución de kmer-13 en c++:"
time ./data/k-mer13 #tarda un par de segundos
echo

echo "Tiempo para la ejecución de kmer-14 en c++:"
time ./data/k-mer14 #tarda unos 15 segundos
echo

echo "Tiempo para la ejecución de kmer-8 en python:"
time python3.6 ./data/k-mer8.py #tarda menos de un segundo
echo

echo "Tiempo para la ejecución de kmer-13 en python:"
time python3.6 ./data/k-mer13.py #tarda unos 12 minutos
echo

echo "Tiempo para la ejecución de kmer-14 en python:"
time python3.6 ./data/k-mer14.py

