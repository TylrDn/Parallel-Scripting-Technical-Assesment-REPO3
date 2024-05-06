# Parallel Scripting Technical Assesment (Repo 1)
 For use launching Interactive workflows on the Parallel Works Platform

.github/workflows/wftest.yml to define a GitHub Actions workflow that tests your Parallel Works workflow

test-data/ directory with small sample input files for testing


workflow-test.yml to specify the Planemo tests

Brief description of what the workflow does
Required inputs and parameters
Example commands to run the workflow
Overview of key files in the repo
Any setup steps or dependencies

In the .github/workflows/wftest.yml file, add:

yaml
name: Workflow tests
on: 
  schedule:
    - cron: '0 0 * * 0'
  workflow_dispatch:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
      - name: Install Planemo
        run: pip install planemo
      - name: Run workflow tests
        run: planemo test workflow.ga

        This will install Planemo and run the workflow tests on a weekly schedule or manual trigger.
    
In the workflow-test.yml file, specify the test cases:

- doc: Test workflow with sample data
  job:
    workflow.ga:
      input1:
        value: test-data/input1.txt
        type: File
      parameter1: somevalue
  outputs:
    output1:
      file: output1.txt



Commit and push all the files to your GitHub repo.
On Parallel Works, go to Workflows -> Create New Workflow
Select "GitHub" and specify your repository URL, branch, and paths to the workflow.xml, thumbnail, and README.md
Save the workflow, then test running it on Parallel Works with the sample inputs.
Verify the GitHub Actions workflow runs successfully and the Planemo tests pass.
Update your README, workflow XML, and test cases as needed.

The key aspects are:
Using GitHub Actions for continuous testing of the workflow
Providing documentation and sample data in the README
Specifying the workflow interface in workflow.xml
Defining test cases with Planemo in workflow-test.yml
Connecting the GitHub repo to create the Parallel Works workflow

This sets up a development lifecycle where changes to the workflow can be made in the GitHub repo, automatically tested, and synced to Parallel Works.

# Interactive Desktop Workflow

This workflow launches an interactive Linux desktop environment using noVNC on the Parallel Works platform. It includes steps to install OpenMPI, build Singularity containers, and run parallel hello world jobs with Slurm.

## Workflow Description

The Interactive Desktop Workflow sets up a remote desktop session using noVNC, allowing users to interact with a Linux desktop environment hosted on a Parallel Works cluster. The workflow also demonstrates how to install OpenMPI, build Singularity containers with MPI support, and execute parallel jobs across multiple nodes using Slurm.

## Required Inputs

- `desktop_type`: The type of desktop environment to launch (e.g., GNOME, KDE)
- `num_nodes`: The number of nodes to allocate for the interactive session
- `partition`: The Slurm partition to use for the job
- `time_limit`: The time limit for the interactive session (in minutes)

## Parameters

- `container_url`: URL to the Singularity container image to use (default: docker://ubuntu:latest)
- `mpi_version`: Version of OpenMPI to install (default: 4.0.5)

## Example Commands

To run the workflow with default settings:

```bash
pw run interactive-desktop

######################################################################################################################################################
pw run interactive-desktop --desktop_type KDE --num_nodes 4 --partition gpu --time_limit 120
######################################################################################################################################################
# FILES:
#     workflow.xml: Defines the workflow interface and execution steps
#     workflow.sh: The main bash script that sets up the interactive desktop and runs the MPI tasks
#     hello-world.def: Singularity definition file for building the MPI hello world container
#     hello-world.sbatch: Slurm batch script for running the MPI hello world job
#     test-data/: Directory containing sample input files for testing the workflow
#     .github/workflows/wftest.yml: GitHub Actions workflow for continuous testing
#     workflow-test.yml: Planemo test definitions for the workflow
######################################################################################################################################################
#     Setup and Dependencies
#     Install the Parallel Works CLI on your local machine
#     Clone this repository: git clone https://github.com/yourusername/interactive-desktop-workflow.git
#     Connect the repository to a new workflow on the Parallel Works platform
#     Ensure a Parallel Works cluster is running with Slurm and Singularity installed
#     Launch the workflow, specifying the desired inputs and parameters
######################################################################################################################################################
#     License
#     This workflow is released under the MIT License. See the LICENSE file for more details.
######################################################################################################################################################
This README template provides an overview of the key components of your workflow, including a description, required inputs, parameters, example commands, key files, setup steps, and license information. You can customize it further based on your specific workflow details and requirements.

Remember to replace `yourusername` in the repository URL with your actual GitHub username, and update the input names, default values, and file names to match your actual workflow.
