# Arabidopsis MYB119 DAP-seq Peak Annotation and Feature Overlap Analysis

## Overview

This project performs **genome annotation and feature overlap analysis** using real *Arabidopsis thaliana* MYB119 DAP-seq peak data.

The goal of this project is to identify how experimentally detected **MYB119 transcription factor binding peaks** are distributed across key genome annotation features, including:

* Genes
* Exons
* Coding sequences
* 1 kb upstream promoter regions

This workflow represents a common task in **regulatory genomics**, where experimentally identified DNA-binding regions are compared with annotated genome features to support biological interpretation.

---

## Research Question

**Where do MYB119 DAP-seq binding peaks occur relative to annotated genomic features in the *Arabidopsis thaliana* TAIR10 genome?**

This project specifically asks:

* How many genes, exons, CDS regions, and promoter regions are present in the genome annotation?
* How many MYB119 DAP-seq peaks overlap genes?
* How many MYB119 DAP-seq peaks overlap exons?
* How many MYB119 DAP-seq peaks overlap coding sequences?
* How many MYB119 DAP-seq peaks overlap 1 kb upstream promoter regions?

---

## Biological Background

MYB119 is a transcription factor in *Arabidopsis thaliana*. Transcription factors regulate gene expression by binding to specific DNA regions.

DAP-seq is an experimental method used to identify genome-wide DNA-binding sites of transcription factors. By overlapping DAP-seq peaks with genome annotation features, researchers can investigate whether transcription factor binding occurs near genes, promoters, coding regions, or other functional genomic elements.

This type of analysis is relevant to:

* Regulatory genomics
* Functional genome annotation
* Transcription factor binding analysis
* Gene regulation studies
* Plant genomics
* Peak annotation workflows

---

## Dataset Summary

| Category | Details |
|---|---|
| Organism | *Arabidopsis thaliana* |
| Genome assembly | TAIR10 |
| Candidate regions | MYB119 DAP-seq peaks |
| Peak data type | Transcription factor binding regions |
| Peak format | `narrowPeak` |
| Annotation format | `GFF3` |
| Analysis format | `BED` |
| Main analysis tool | BEDTools |

---

## Data Sources

This project uses publicly available genomic datasets.

| Data Type | Source |
|---|---|
| Genome annotation | Ensembl Plants *Arabidopsis thaliana* TAIR10 GFF3 annotation |
| Genome FASTA | Ensembl Plants *Arabidopsis thaliana* TAIR10 genome sequence |
| DAP-seq peaks | Public MYB119 DAP-seq peak file from NCBI GEO |
| Peak file format | `narrowPeak` |

Large raw files such as genome FASTA files, GFF3 annotation files, and compressed raw datasets are **not included** in this repository. They are downloaded automatically using the scripts provided in the `scripts/` folder.

---

## Tools and Technologies

* Google Colab
* Linux command line
* Bash scripting
* AWK
* Samtools
* BEDTools
* GitHub
* Markdown documentation

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
```

---

## Workflow

### 1. Genome Annotation Preparation

The *Arabidopsis thaliana* genome annotation file was downloaded in `GFF3` format.

The annotation file was parsed to extract the following genomic features:

* Genes
* Exons
* Coding sequences
* 1 kb upstream promoter regions

The extracted features were converted into `BED` format for interval-based genomic analysis.

---

### 2. Coordinate Format Conversion

Genome annotation files and BED files use different coordinate systems.

| Format | Coordinate System |
|---|---|
| `GFF3` | 1-based coordinates |
| `BED` | 0-based start coordinates |

Because BEDTools requires `BED` format, the start coordinate from the GFF3 file was adjusted during conversion.

This step is important because incorrect coordinate conversion can lead to inaccurate overlap results.

---

### 3. Promoter Region Generation

Promoter regions were defined as:

```text
1 kb upstream of each gene
```

Promoter regions were generated using BEDTools `flank`.

The analysis was performed in a strand-aware manner using the `-s` option, so upstream regions were calculated according to gene orientation.

---

### 4. MYB119 DAP-seq Peak Preparation

The MYB119 DAP-seq peak file was downloaded in `narrowPeak` format.

The peak file was converted into a clean `BED` file and used as the candidate regulatory region file for overlap analysis.

The final candidate region file was:

```text
data/processed/candidate_regions.bed
```

---

### 5. Feature Overlap Analysis

MYB119 DAP-seq peaks were overlapped with the following annotation features:

* Genes
* Exons
* CDS regions
* 1 kb upstream promoters

BEDTools `intersect` was used to identify overlapping genomic intervals and generate result tables.

---

## Scripts

| Script | Purpose |
|---|---|
| `scripts/01_prepare_annotation.sh` | Downloads genome annotation and genome FASTA files, extracts genes, exons, CDS regions, and generates promoter regions |
| `scripts/02_prepare_dapseq_peaks.sh` | Downloads and prepares MYB119 DAP-seq peak regions |
| `scripts/03_feature_overlap_analysis.sh` | Performs BEDTools overlap analysis and generates result tables |

---

## How to Reproduce the Analysis

Run the scripts in the following order:

```bash
bash scripts/01_prepare_annotation.sh
bash scripts/02_prepare_dapseq_peaks.sh
bash scripts/03_feature_overlap_analysis.sh
```

The workflow will:

1. Download the required public datasets
2. Prepare annotation feature files
3. Prepare MYB119 DAP-seq peak regions
4. Perform feature overlap analysis
5. Generate summary result tables

---

## Key Annotation Feature Counts

The following genome annotation features were extracted from the TAIR10 annotation file:

| Feature Type | Count |
|---|---:|
| Genes | 27,655 |
| Exons | 313,952 |
| CDS regions | 286,067 |
| 1 kb promoters | 27,655 |

These values confirm that annotation feature extraction and promoter generation were completed successfully.

---

## Main Output Files

| Output File | Description |
|---|---|
| `results/feature_counts.tsv` | Summary of extracted annotation feature counts |
| `results/MYB119_overlap_summary.tsv` | Summary of MYB119 peak overlaps with genomic features |
| `results/MYB119_gene_overlaps.tsv` | MYB119 peaks overlapping gene regions |
| `results/MYB119_exon_overlaps.tsv` | MYB119 peaks overlapping exon regions |
| `results/MYB119_cds_overlaps.tsv` | MYB119 peaks overlapping CDS regions |
| `results/MYB119_promoter_overlaps.tsv` | MYB119 peaks overlapping 1 kb upstream promoter regions |

---

## MYB119 Peak Overlap Summary

The main overlap summary is available in:

```text
results/MYB119_overlap_summary.tsv
```

This file reports:

* Feature type
* Number of overlapping MYB119 peaks
* Total number of MYB119 peaks
* Percentage of peaks overlapping each feature type

A detailed interpretation is provided in:

```text
results_summary.md
```

---

## Interpretation

This project identifies how MYB119 DAP-seq binding peaks are distributed across annotated genomic regions.

Peaks overlapping **promoter regions** may represent potential regulatory binding sites because promoters are commonly involved in transcriptional regulation.

Peaks overlapping **genes, exons, or CDS regions** may indicate transcription factor binding within transcribed or protein-coding regions.

This analysis provides a foundation for understanding the genomic distribution of MYB119 binding sites and demonstrates how functional genomic regions can be connected with genome annotation features.

---

## Skills Demonstrated

This project demonstrates practical bioinformatics skills in:

* Genome annotation analysis
* Public genomic dataset usage
* `GFF3` file parsing
* `BED` file preparation
* Genomic coordinate conversion
* DAP-seq peak annotation
* Promoter region generation
* BEDTools interval analysis
* Command-line bioinformatics
* Bash scripting
* Reproducible workflow organization
* GitHub project documentation
* Markdown reporting

---

## Portfolio Relevance

This project is suitable for a bioinformatics portfolio because it demonstrates a complete analysis workflow using real biological data.

It shows the ability to:

* Work with public genomic datasets
* Understand common genomics file formats
* Use command-line tools for genomic interval analysis
* Organize scripts and results in a reproducible structure
* Document the workflow clearly for GitHub
* Interpret results in a biological context

The project connects technical bioinformatics skills with a meaningful biological question in plant regulatory genomics.

---

## Limitations

This project focuses on basic feature overlap analysis. It does not yet include:

* Nearest-gene assignment
* Motif enrichment analysis
* Functional enrichment analysis
* Statistical enrichment testing
* Comparison with additional transcription factors
* Visualization of peak distributions

These limitations provide clear directions for future improvement.

---

## Future Improvements

Potential extensions of this project include:

* Add nearest-gene analysis for MYB119 peaks
* Visualize overlap percentages using bar plots
* Compare MYB119 with additional *Arabidopsis* transcription factors
* Perform motif enrichment analysis
* Perform gene ontology enrichment analysis of nearby genes
* Add peak distribution analysis across chromosomes
* Create a Snakemake or Nextflow workflow for automation
* Add Python-based visualization of overlap results

---

## Project Status

**Status:** Completed basic workflow

Completed components:

* Genome annotation download
* GFF3 feature extraction
* BED format conversion
* Promoter region generation
* MYB119 DAP-seq peak preparation
* BEDTools feature overlap analysis
* Summary table generation
* GitHub-ready documentation

---

## Author

**Hadia Shahjahan**

Bioinformatics learner building reproducible genomics projects using public datasets, command-line tools, and GitHub documentation.