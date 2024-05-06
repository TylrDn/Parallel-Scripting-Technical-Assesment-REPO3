## The main bash script that sets up the interactive desktop and runs the MPI tasks
#!/bin/bash

# Set up the interactive desktop environment
DESKTOP_IMAGE="/path/to/desktop-${desktop_type,,}.sif"
srun --nodes=$num_nodes --partition=$partition --time=$time_limit:00 --pty singularity exec --writable-tmpfs $DESKTOP_IMAGE /usr/bin/startvnc.sh

# Run the MPI hello world job
MPI_IMAGE="/path/to/hello-world-mpi.sif"
srun --nodes=$num_nodes --partition=$partition --time=$time_limit:00 singularity exec $MPI_IMAGE /opt/mpi/bin/mpirun /opt/hello-world/hello