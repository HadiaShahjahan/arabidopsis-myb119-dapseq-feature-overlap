#!/bin/bash

mkdir -p data/raw data/processed results/figures scripts

apt-get update -qq
apt-get install -y samtools bedtools

cd data/raw

wget -O annotation.gff3.gz "https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-63/gff3/arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.63.gff3.gz"

wget -O genome.fa.gz "https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-63/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz"

gunzip -f annotation.gff3.gz
gunzip -f genome.fa.gz

cd ../..

samtools faidx data/raw/genome.fa

cut -f1,2 data/raw/genome.fa.fai > data/processed/genome_file.txt

awk 'BEGIN{OFS="\t"}
!/^#/ && $3=="gene" {
  id=".";
  n=split($9,a,";");
  for(i=1;i<=n;i++){
    split(a[i],b,"=");
    if(b[1]=="ID"){id=b[2];}
  }
  gsub(/^gene:/,"",id);
  print $1,$4-1,$5,id,$6,$7
}' data/raw/annotation.gff3 > data/processed/genes.bed

awk 'BEGIN{OFS="\t"}
!/^#/ && $3=="exon" {
  id=".";
  n=split($9,a,";");
  for(i=1;i<=n;i++){
    split(a[i],b,"=");
    if(b[1]=="ID"){id=b[2];}
  }
  gsub(/^exon:/,"",id);
  print $1,$4-1,$5,id,$6,$7
}' data/raw/annotation.gff3 > data/processed/exons.bed

awk 'BEGIN{OFS="\t"}
!/^#/ && $3=="CDS" {
  id=".";
  n=split($9,a,";");
  for(i=1;i<=n;i++){
    split(a[i],b,"=");
    if(b[1]=="ID"){id=b[2];}
  }
  gsub(/^CDS:/,"",id);
  print $1,$4-1,$5,id,$6,$7
}' data/raw/annotation.gff3 > data/processed/cds.bed

bedtools flank \
  -i data/processed/genes.bed \
  -g data/processed/genome_file.txt \
  -l 1000 \
  -r 0 \
  -s > data/processed/promoters_1kb.bed

echo "Annotation preparation completed."
