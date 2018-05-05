# orthoMCLtoVennDiagramm

It takes the output from OrthoMCL, gives you the orthologous Venn Diagramm of species listed by you.

sudo cpanm Statistics::R --force

# input files

groups.txt - this is the output from orthoMCL

singletons.txt - this file is produced by running orthoMCL's orthomclSingletons and contains all genes that are contained in no groups

names.txt - ToDo!!!!

 Example:

# Running it

perl OrthoMCLtoVennDiagramm.perl -h

usage: OrthoMCLtoVennDiagramm.perl groups.txt singletons.txt names.txt 

# positional arguments:
    groups      -Path to groups.txt
    
    singletons  -Path to singletons file (use orthomclSingletons, part of
    orthomcl)
    
    groupNames  -Path to list file detailing groups Names of interest
   
