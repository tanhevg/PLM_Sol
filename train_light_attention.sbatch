#!/bin/env bash

#SBATCH --time=1-
#SBATCH --nodes=1
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=64G
#SBATCH -J "plm_sol_train_light_attention"
#SBATCH -o "/homes/evgeny/nobackup/log/%x_%j.out"
#SBATCH -e "/homes/evgeny/nobackup/log/%x_%j.err"

. ~/.bashrc
micromamba activate plm_sol
. ~/code/protein_production/scripts/ai/env_ebi.sh
export TEMPDIR=~/nobackup/tmp
export XDG_CACHE_HOME=~/nobackup/.cache
cd ~/code/PLM_Sol
python train.py --config ./configs/SOL_light_attention.yml
