6/9/24
cross check uniref90 annotations against db 

need to run this next week when quest is back up - uniprotkb  ((protein_name:nitrate) OR (protein_name:nitrite) OR (protein_name:"nitric oxide") OR (protein_name:"nitrous oxide") NOT (protein_name:fragment)) AND (taxonomy_id:2) 

6/7/24
Manual review of bins - looking for PAO, GAO, then will look at prokka annotations


5/17/24
megahit ran but snakemake job was incomplete because a tmp folder couldn't get deleted properly
moving on to assembly analysis and binning

5/16/24
GTDBTK database location
conda env config vars set GTDBTK_DATA_PATH="/projects/b1052/databases/release214";
