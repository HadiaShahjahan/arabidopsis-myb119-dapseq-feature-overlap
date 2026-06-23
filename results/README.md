# Results Folder

This folder contains the output files generated from the Arabidopsis MYB119 DAP-seq peak annotation and feature overlap analysis.

## Main Result Files

| File | Description |
|---|---|
| `feature_counts.tsv` | Summary of extracted genome annotation feature counts |
| `MYB119_overlap_summary.tsv` | Summary of MYB119 DAP-seq peak overlaps with genes, exons, CDS regions, and 1 kb promoter regions |

## Detailed Overlap Files

| File | Description |
|---|---|
| `MYB119_gene_overlaps.tsv` | Detailed records of MYB119 peaks overlapping gene regions |
| `MYB119_exon_overlaps.tsv` | Detailed records of MYB119 peaks overlapping exon regions |
| `MYB119_cds_overlaps.tsv` | Detailed records of MYB119 peaks overlapping CDS regions |
| `MYB119_promoter_overlaps.tsv` | Detailed records of MYB119 peaks overlapping 1 kb upstream promoter regions |

## Notes

The raw genome FASTA, GFF3 annotation, and DAP-seq peak files are not included in this repository because they are large public datasets.

These raw files can be downloaded and regenerated using the scripts provided in the `scripts/` folder.