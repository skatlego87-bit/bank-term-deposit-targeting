#!/usr/bin/env bash
# Reproduce every table and figure from scratch (about 2 minutes on a laptop).
#   pip install -r requirements.txt   (Python 3.10+)      R needs: dplyr readr pROC ggplot2
set -euo pipefail
cd "$(dirname "$0")"

(cd python
  python 01_audit_eda.py > /dev/null
  python 02_validation_experiment.py > /dev/null
  python 03_calling_policy.py > /dev/null
  python 05_adjusted_logit.py > /dev/null)

Rscript r/replication.R > /dev/null

(cd python
  python 06_crosscheck.py
  python 04_figures.py)
echo "Done. See outputs/tables and outputs/figures."
