# teichman-hmp

This holds code and some files for pulling, parsing, and processing a subset of 324 samples from the Human Microbiome Project.

Workflows for downloading the SRA data and metagenomics processing through to the gene-level KO coverage tables were used from my [bit package](https://github.com/AstrobioMike/bit), retrieved and run as shown below:

```bash
conda create -n bit -c astrobiomike -c conda-forge -c bioconda -c defaults bit=1.9.1

conda activate bit

bit-get-workflow sra-download

#   The sra-download workflow was downloaded to
#   'bit-sra-download-wf-v1.0.1/'

#     It was pulled from this release page:
#         https://api.github.com/repos/astrobiomike/bit/releases

bit-get-workflow metagenomics

#   The metagenomics workflow was downloaded to
#   'bit-metagenomics-wf-v1.0.1/'

#     It was pulled from this release page:
#         https://api.github.com/repos/astrobiomike/bit/releases

## after modifying config.yaml files as appropriate, each were run in the bit conda environment in their respective directories with
snakemake --use-conda --conda-prefix ${CONDA_PREFIX}/envs -j 8 -p
```

Due to storage limitations, I divided the 324 total samples into 7 sets, processed them individually, then combined the output "Combined-gene-level-KO-function-coverages.tsv" tables into one file.

**The "log" file in the processing sub-directory here shows all code except `scp` commands between local and server, and the "notes.txt" file in there has some more general info.**

Read-recruitment to all assemblies was overall great:

```bash
bit-summarize-column -i read-recruitment-percentages-from-bowtie2.tsv -c 2

#   Column '2' summary

#     N:              322
#     Min:            47.92
#     Max:            98.45
#     Mean:           92.13
#     Median:         93.88
#     StDev:          6.44

#     Percentiles:

#         1st:        62.31
#         5th:        80.16
#         10th:       86.49
#         25th:       90.98
#         50th:       93.88
#         75th:       95.71
#         90th:       96.91
#         95th:       97.52
#         99th:       98.08
```
