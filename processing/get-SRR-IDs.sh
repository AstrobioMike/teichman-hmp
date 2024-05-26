for i in $(cat all-SRS-IDs.txt)
do
    grep -w "${i}" all-bioproject-metadata.tsv | cut -f 13,22 

done > all-SRS-IDs-and-SRR-IDs.tsv
