# teichman-hmp

This is a temporary space holding code and some files for pulling, parsing, and processing a subset of the HMP data.

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

The "log" file in the processing sub-directory shows all code execpt `scp` commands between local and server, and the "notes.txt" file in there has some more general info.
