# Results Summary

## Project Title

**Arabidopsis MYB119 DAP-seq Peak Annotation and Feature Overlap Analysis**

---

## Dataset Summary

This project used real *Arabidopsis thaliana* MYB119 DAP-seq peak data as candidate regulatory regions.

The peak data were downloaded in `narrowPeak` format and converted into `BED` format for genomic interval analysis.

Genome annotation data for *Arabidopsis thaliana* TAIR10 were used to extract the following genomic features:

* Genes
* Exons
* Coding sequences
* 1 kb upstream promoter regions

---

## Annotation Feature Counts

| Feature Type | Count |
|---|---:|
| Genes | 27,655 |
| Exons | 313,952 |
| CDS regions | 286,067 |
| 1 kb promoters | 27,655 |

---

## MYB119 DAP-seq Peak Overlap Summary

| Feature Type | Overlapping Peaks | Total Peaks | Percentage |
|---|---:|---:|---:|
| Genes | 5054 | 9278 | 54.47 |
| Exons | 4848 | 9278 | 52.25 |
| CDS regions | 3419 | 9278 | 36.85 |
| 1 kb promoters | 3197 | 9278 | 34.46 |

---

## Interpretation

The overlap analysis identified how MYB119 DAP-seq binding peaks are distributed across annotated genomic features.

Peaks overlapping promoter regions may represent potential regulatory binding sites.

Peaks overlapping genes, exons, or CDS regions may indicate binding events within transcribed or protein-coding regions.

This analysis provides a basic regulatory genomics workflow for connecting experimentally identified DNA-binding regions with genome annotation features.

---

## Conclusion

This project demonstrates a reproducible bioinformatics workflow for genome annotation and feature overlap analysis using real public DAP-seq data.

The workflow includes:

* GFF3 parsing
* BED file preparation
* Promoter region generation
* BEDTools-based overlap analysis
* Summary table generation

---

## Files Generated

| File | Description |
|---|---|
| `feature_counts.tsv` | Summary of extracted genome annotation feature counts |
| `MYB119_overlap_summary.tsv` | Summary of MYB119 peak overlaps with genomic features |
| `MYB119_gene_overlaps.tsv` | MYB119 peaks overlapping gene regions |
| `MYB119_exon_overlaps.tsv` | MYB119 peaks overlapping exon regions |
| `MYB119_cds_overlaps.tsv` | MYB119 peaks overlapping CDS regions |
| `MYB119_promoter_overlaps.tsv` | MYB119 peaks overlapping 1 kb promoter regions |

---

## Skills Demonstrated

* Genome annotation analysis
* GFF3 to BED conversion
* DAP-seq peak annotation
* BEDTools feature overlap analysis
* Promoter region generation
* Command-line bioinformatics
* Reproducible workflow documentation
