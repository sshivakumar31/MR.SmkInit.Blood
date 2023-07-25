Data from http://www.mhi-humangenetics.org/en/resources/
Downloaded by CST on Oct 10, 2020
           #These data are primarly managed by Guillam Lettre
           #Note that there are exonic coding mutants on this website from 
'Rare coding variants pinpoint genes that control human hematological 
traits, PLoS Genet 2017'
           #Also a bunch of Summary Exome Chip data that were published in 
3 papers in Am J Hum Genet. 2016 Jun 21

using the following command to recursively do this:
#within /project/voight_datasets/GWAS/59_2020BloodTraits
#download stuff (the -b is for background)
wget -b -r --no-parent -A 'BCX2_*out.gz' 
http://www.mhi-humangenetics.org/dataset/
     ##Continuing in background, pid 122044.
     ##Output will be written to “wget-log”.

#then move
mv www.mhi-humangenetics.org/dataset/* .

#then delete the empty folders
rm -r www.mhi-humangenetics.org

#deleted the wget-log, which was 257Mb (!!)
rm wget-log
   ## final lines were
   FINISHED --2020-11-04 19:01:25--
   Downloaded: 100 files, 164G in 4h 31m 3s (10.3 MB/s)



These are data related to 2 companion Cell papers:

Vuckovic et al. Cell. 2020 Sep 3;182(5):1214-1231.e11. doi: 
10.1016/j.cell.2020.08.008. PMID: 32888494
The Polygenic and Monogenic Basis of Blood Traits and Diseases.

Chen et al. Cell. 2020 Sep 3;182(5):1198-1213.e14. doi: 
10.1016/j.cell.2020.06.045. PMID: 32888493
Trans-ethnic and Ancestry-Specific Blood-Cell Genetics in 746,667 
Individuals from 5 Global Populations.

The REFERENCE allele is the effect allele

These are in hg19 genome

Info related to file names:
Trans_MRMEGA = MR-MEGA Trans-ethnic
Trans_GWAMA = GWAMA Trans-ethnic
EA = European
EAS = East Asian
AA = African
HA = Hispanic



# 211118 Nov 18, 2021
CST used script from Mitchell Conery to identify rsids for EA data
within /GRCh37_to_rsid there are bed.gz files that include rsid instead of 
rs_number which was organized as chr:pos_allele1_allele2
these were created with the script
bsub -o out%J -e error%J sh clean_blood_traits.sh
which took a few hours to complete
