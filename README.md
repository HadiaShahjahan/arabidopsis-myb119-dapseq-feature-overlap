This project performs genome annotation and feature overlap analysis using real Arabidopsis thaliana MYB119 DAP-seq peak data and TAIR10 genome annotation.

The aim of the project was to identify how experimentally derived transcription factor binding regions overlap important genomic features including genes, exons, coding sequences, and 1 kb upstream promoter regions.

The workflow includes downloading public genomic datasets, parsing GFF3 annotation files, converting genomic features into BED format, generating promoter regions, and using BEDTools to perform interval-based overlap analysis.