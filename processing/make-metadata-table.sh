printf "SRS_ID\tsite\tsex\tHMP_sample_ID\n" > metadata-table.tsv

for SRS in $(cat all-SRS-IDs.txt)
do

    SAMPLE_ID=$(grep -m 1 "${SRS}" hmp_manifest_52abb72a95.tsv | cut -f 5)
    INFO=$(grep -m 1 "${SAMPLE_ID}" hmp_manifest_metadata_2f19dea871.tsv | cut -f 4,6)

    printf "$SRS\t${INFO}\t${SAMPLE_ID}\n"

done >> metadata-table.tsv
