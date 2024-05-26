import pandas as pd

individual_table_paths = ['p1-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv', 
                          'p2-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv', 
                          'p3-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv',
                          'p4-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv',
                          'p5-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv',
                          'p6-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv',
                          'p7-workflow-components/workflow-outputs/combined-outputs/Combined-gene-level-KO-function-coverages.tsv']

merged_df = pd.read_csv(individual_table_paths[0], sep='\t')

for file in individual_table_paths[1:]:
    t = pd.read_csv(file, sep='\t')
    merged_df = merged_df.merge(t, on=['KO_ID', 'KO_function'], how='outer')

merged_df = merged_df.fillna(0)

merged_df.to_csv('Combined-gene-level-KO-function-coverages.tsv', sep='\t', index = False)
