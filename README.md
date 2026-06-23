# Arabidopsis MYB119 DAP-seq Peak Annotation and Feature Overlap Analysis

## Project Overview

This project performs genome annotation and feature overlap analysis using real *Arabidopsis thaliana* MYB119 DAP-seq peak data.

The goal of the project is to determine how experimentally identified **MYB119 transcription factor binding peaks** overlap important genome annotation features, including:

* Genes
* Exons
* Coding sequences
* 1 kb upstream promoter regions

This type of analysis is commonly used in **regulatory genomics** to interpret transcription factor binding regions and identify their relationship with functional genome features.

---

## Dataset

| Category | Details |
|---|---|
| Organism | *Arabidopsis thaliana* |
| Genome assembly | TAIR10 |
| Candidate regions | MYB119 DAP-seq peaks |
| Peak format | `narrowPeak` |
| Annotation format | `GFF3` |
| Interval analysis format | `BED` |

---

## Tools and Technologies

* Google Colab
* Linux command line
* BEDTools
* Samtools
* AWK
* GitHub

---

## Project Workflow

1. Downloaded *Arabidopsis thaliana* TAIR10 genome annotation and genome FASTA files.
2. Extracted genes, exons, and CDS regions from the `GFF3` annotation file.
3. Converted `GFF3` annotation features into `BED` format.
4. Generated 1 kb upstream promoter regions from gene coordinates.
5. Downloaded real MYB119 DAP-seq peak data.
6. Converted `narrowPeak` data into `BED` format.
7. Used BEDTools to overlap MYB119 peaks with genes, exons, CDS regions, and promoters.
8. Generated summary tables for annotation feature counts and peak overlap results.

---

## Repository Structure

```text
arabidopsis-myb119-dapseq-feature-overlap/
├── README.md
├── results_summary.md
├── .gitignore
├── LICENSE
├── scripts/
│   ├── 01_prepare_annotation.sh
│   ├── 02_prepare_dapseq_peaks.sh
│   └── 03_feature_overlap_analysis.sh
├── results/
│   ├── feature_counts.tsv
│   ├── MYB119_overlap_summary.tsv
│   ├── MYB119_gene_overlaps.tsv
│   ├── MYB119_exon_overlaps.tsv
│   ├── MYB119_cds_overlaps.tsv
│   └── MYB119_promoter_overlaps.tsv
└── notebooks/
    └── genome_annotation_feature_overlap_analysis.ipynb