#!/bin/bash

mkdir -p data/raw data/processed
cd data/raw

wget -o MYB119_DAPseq_peaks.narrowPeak.gz
