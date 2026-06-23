#!/bin/bash
mkdir -p results

sort -k1,1 -k2,2n data/processed/candidate_regions.bed > data/processed/candidate_regions.sorted.bed
