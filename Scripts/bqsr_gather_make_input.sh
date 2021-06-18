#!/bin/bash

##########################################################################
#
# Platform: NCI Gadi HPC
# Usage: bash bqsr_gather_make_input.sh <config prefix>
# Version: 2.0
#
# For more details see: https://github.com/Sydney-Informatics-Hub/Fastq-to-BAM
#
# If you use this script towards a publication, please acknowledge the
# Sydney Informatics Hub (or co-authorship, where appropriate).
#
# Suggested acknowledgement:
# The authors acknowledge the support provided by the Sydney Informatics Hub,
# a Core Research Facility of the University of Sydney. This research/project
# was undertaken with the assistance of resources and services from the National
# Computational Infrastructure (NCI), which is supported by the Australian
# Government, and the Australian BioCommons which is enabled by NCRIS via
# Bioplatforms Australia funding.
#
##########################################################################

cohort=../$1

input=./Inputs/bqsr_gather.inputs

rm -f $input

while read -r sampleid labid seq_center library; do
        if [[ ! ${sampleid} =~ ^#.*$ ]]
        then
                echo $labid >> $input
        fi
done < "${cohort}.config"

tasks=`wc -l < $input`
printf "Number of BQSR gather tasks to run: ${tasks}\n"
