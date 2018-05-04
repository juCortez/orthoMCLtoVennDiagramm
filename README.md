# orthoMCLtoVennDiagramm
It takes the output from OrthoMCL, gives you the orthologous Venn Diagramm of species listed by you.


input files

groups.txt - this is the output from orthoMCL
singletons.txt - this file is produced by running orthoMCL's orthomclSingletons and contains all genes that are contained in no groups.
families.txt - this file details which species are in which groups, first the name of the group, then the short handles that appear in groups.txt. Example:

Running it

python OrthoMCLtoVennDiagramm.py -h
usage: OrthoMCLtoVennDiagramm.py [-h] groups singletons families 

Parses orthomcl groups.txt and singletons, plots a Venn diagram of the number
of genes in shared and non-shared clusters

positional arguments:
    groups      Path to groups.txt
    singletons  Path to singletons file (use orthomclSingletons, part of
    orthomcl)
    families    Path to file detailing groups of species/families - see README
   
