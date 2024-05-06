#!/bin/bash
#SBATCH --job-name=hello-world-mpi
#SBATCH --output=hello-world-mpi_%j.out
#SBATCH --error=hello-world-mpi_%j.err
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --partition=compute
#SBATCH --time=00:10:00
#SBATCH --constraint=skylake

# Load necessary modules
module load singularity

# Define container image and mpirun command
container="./hello-world-mpi.sif"
mpirun_cmd="singularity run --mpi $container"

# Print job information
echo "Running Hello World MPI job on Slurm"
echo "Job ID: $SLURM_JOB_ID"
echo "Node list: $SLURM_JOB_NODELIST"
echo "Number of nodes: $SLURM_JOB_NUM_NODES"
echo "Tasks per node: $SLURM_NTASKS_PER_NODE"
echo "CPUs per task: $SLURM_CPUS_PER_TASK"

# Run the MPI Hello World program
$mpirun_cmd
