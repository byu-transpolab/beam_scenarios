#!/bin/bash

#SBATCH --time=20:00:00   # walltime
#SBATCH --ntasks=6
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=40G   # memory per CPU core
#SBATCH -J "test_wfrc"   # job name
#SBATCH --mail-user=shaydenatch@gmail.com   # email address
##SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE
SCNAME="base"

module purge
module load jdk/1.8
echo "Loaded Modules"
module list

java -Xmx210G -jar beam.jar --config scenarios/wfrc/configs/updated_conf.conf
