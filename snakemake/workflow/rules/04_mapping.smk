rule map_competibacter_denit:
    input: 
        r1 = get_trimmed_r1,
        r2 = get_trimmed_r2
    output:
        "results/minimap/{sample}/{sample}_comp_denit_depth.txt"
    params:
        ref = "/projects/b1052/mckenna/resources/reference_genomes/competibacter/GCA_001051235.2_ASM105123v2_genomic.fna",
        sam = "results/minimap/{sample}/{sample}_comp_denit_map.sam",
        bam = "results/minimap/{sample}/{sample}_comp_denit_map_sorted.bam"
    shell:
        """
        module load samtools/1.14
        
        /home/mmf8608/programs/minimap2-2.28_x64-linux/minimap2 -ax sr \
        {params.ref} {input.r1} {input.r2} > {params.sam}

        samtools sort {params.sam} -o {params.bam}

        samtools depth {params.bam} -o {output}
        
        """

rule map_dechloro_denit:
    input: 
        r1 = get_trimmed_r1,
        r2 = get_trimmed_r2
    output:
        "results/minimap/{sample}/{sample}_dechloro_vorans_depth.txt"
    params:
        ref = "/projects/b1052/mckenna/resources/reference_genomes/dechloro/GCA_016709495.1_ASM1670949v1_genomic.fna",
        sam = "results/minimap/{sample}/{sample}_dechloro_vorans_map.sam",
        bam = "results/minimap/{sample}/{sample}_dechloro_vorans_map_sorted.bam"
    resources:
        mem="10G",
        time="05:00:00"
    shell:
        """
        module load samtools/1.14
        
        /home/mmf8608/programs/minimap2-2.28_x64-linux/minimap2 -ax sr \
        {params.ref} {input.r1} {input.r2} > {params.sam}

        samtools sort {params.sam} -o {params.bam}

        samtools depth {params.bam} -o {output}
        
        """