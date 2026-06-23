#!/bin/bash

mkdir -p data/raw data/processed

cd data/raw

wget -O MYB119_DAPseq_peaks.narrowPeak.gz "https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM1925nnn/GSM1925427/suppl/GSM1925427_DAPSeq-MYB_tnt-MYB119_colamp_a-chr1-5_GEM_events.narrowPeak.gz"

gunzip -f MYB119_DAPseq_peaks.narrowPeak.gz

cd ../..

awk 'BEGIN{OFS="\t"}
{
  chr=$1;
  gsub(/^Chr/,"",chr);
  gsub(/^chr/,"",chr);
  print chr,$2,$3,"MYB119_peak_"NR,$5,$6
}' data/raw/MYB119_DAPseq_peaks.narrowPeak > data/processed/MYB119_DAPseq_peaks.bed

cp data/processed/MYB119_DAPseq_peaks.bed data/processed/candidate_regions.bed

echo "DAP-seq peak preparation completed."