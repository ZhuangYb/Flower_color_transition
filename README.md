# Flower_color_transition
### 1. build phylogenetic tree
This folder contains all codes and flowcharts used for xxxxx


Step1: Trinity assemble of all tissue specific reads

Step2: ProteinOrth search for orthlogs
/Users/yozh2865/Soft/proteinortho_v5.12b/proteinortho5.pl -p=blastn -cpus=90 /mnt/scratch_nobackup/yozh2865/Flower_color/*.fasta -project=flower_iso

Step3: Extract each orth groups using script ProteinOrth_fasta_extraction.pl
perl ProteinOrth_fasta_extraction.pl flower_iso.proteinortho

Step4: Run alignment and rename the output name to make them recognizable by FASconCAT
/Users/yozh2865/Soft/muscle3.8.31_i86linux64 -in $i -out $i.afa
for i in *.afa;do a=`echo $i|perl -ne '$_=~/(.+)fasta.afa/;print "$1",fas'`;mv $i $a;done
perl -i -ne 'if($_=~/(.+?)_TR/){print $1,"\n"}else{print $_}' *fas

Step5: Prepared alignment file for phylm input
FASconCAT_v1.0.pl
Fasta2Phylip.pl

Step6: build phylogeny tree
mpirun -n 32 /Users/yozh2865/Soft/PhyML-3.1/PhyML-3.1_linux64 -i FcC.smatrix.philip -b 30

#### 2. annotation ABP
