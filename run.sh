# download input files
wget -O SRR24112717_R2.fastq https://www.dropbox.com/s/euu28tbzoj29k4p/SRR24112717_R2.fastq?dl=1
wget -O SRR24112717_R1.fastq https://www.dropbox.com/s/jbzcqr8r3qybtk8/SRR24112717_R1.fastq?dl=1

# Run unicycler, assuming that your user can run docker. This command will create the output folder sars-cov2-assembly in your working directory
docker run -it  -v $PWD:/data staphb/unicycler unicycler -1 SRR24112717_R1.fastq -2 SRR24112717_R2.fastq -o sars-cov2-assembly --kmers 13,25 --threads 10

# Run Quast to assess to genome quality
docker run -it -v $PWD:/data staphb/quast quast.py sars-cov2-assembly/assembly.fasta
