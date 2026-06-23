#!/bin/bash

mkdir -p results

sort -k1,1 -k2,2n data/processed/candidate_regions.bed > data/processed/candidate_regions.sorted.bed
sort -k1,1 -k2,2n data/processed/genes.bed > data/processed/genes.sorted.bed
sort -k1,1 -k2,2n data/processed/exons.bed > data/processed/exons.sorted.bed
sort -k1,1 -k2,2n data/processed/cds.bed > data/processed/cds.sorted.bed
sort -k1,1 -k2,2n data/processed/promoters_1kb.bed > data/processed/promoters_1kb.sorted.bed

bedtools intersect \
  -a data/processed/candidate_regions.sorted.bed \
  -b data/processed/genes.sorted.bed \
  -wa -wb > results/MYB119_gene_overlaps.tsv

bedtools intersect \
  -a data/processed/candidate_regions.sorted.bed \
  -b data/processed/exons.sorted.bed \
  -wa -wb > results/MYB119_exon_overlaps.tsv

bedtools intersect \
  -a data/processed/candidate_regions.sorted.bed \
  -b data/processed/cds.sorted.bed \
  -wa -wb > results/MYB119_cds_overlaps.tsv

bedtools intersect \
  -a data/processed/candidate_regions.sorted.bed \
  -b data/processed/promoters_1kb.sorted.bed \
  -wa -wb > results/MYB119_promoter_overlaps.tsv

echo -e "feature_type\tcount" > results/feature_counts.tsv
echo -e "genes\t$(wc -l < data/processed/genes.bed)" >> results/feature_counts.tsv
echo -e "exons\t$(wc -l < data/processed/exons.bed)" >> results/feature_counts.tsv
echo -e "CDS\t$(wc -l < data/processed/cds.bed)" >> results/feature_counts.tsv
echo -e "promoters_1kb\t$(wc -l < data/processed/promoters_1kb.bed)" >> results/feature_counts.tsv

total_peaks=$(wc -l < data/processed/candidate_regions.sorted.bed)

gene_overlap=$(bedtools intersect -a data/processed/candidate_regions.sorted.bed -b data/processed/genes.sorted.bed -u | wc -l)
exon_overlap=$(bedtools intersect -a data/processed/candidate_regions.sorted.bed -b data/processed/exons.sorted.bed -u | wc -l)
cds_overlap=$(bedtools intersect -a data/processed/candidate_regions.sorted.bed -b data/processed/cds.sorted.bed -u | wc -l)
promoter_overlap=$(bedtools intersect -a data/processed/candidate_regions.sorted.bed -b data/processed/promoters_1kb.sorted.bed -u | wc -l)

echo -e "feature_type\toverlapping_peaks\ttotal_peaks\tpercentage" > results/MYB119_overlap_summary.tsv
echo -e "genes\t$gene_overlap\t$total_peaks\t$(awk -v a=$gene_overlap -v b=$total_peaks 'BEGIN{printf "%.2f", (a/b)*100}')" >> results/MYB119_overlap_summary.tsv
echo -e "exons\t$exon_overlap\t$total_peaks\t$(awk -v a=$exon_overlap -v b=$total_peaks 'BEGIN{printf "%.2f", (a/b)*100}')" >> results/MYB119_overlap_summary.tsv
echo -e "CDS\t$cds_overlap\t$total_peaks\t$(awk -v a=$cds_overlap -v b=$total_peaks 'BEGIN{printf "%.2f", (a/b)*100}')" >> results/MYB119_overlap_summary.tsv
echo -e "promoters_1kb\t$promoter_overlap\t$total_peaks\t$(awk -v a=$promoter_overlap -v b=$total_peaks 'BEGIN{printf "%.2f", (a/b)*100}')" >> results/MYB119_overlap_summary.tsv

echo "Feature overlap analysis completed."