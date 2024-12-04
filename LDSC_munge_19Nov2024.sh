########### updated for DeAngelis data, for class

cd /home/lizzy/classes/Final
conda activate ldsc

file=HP.sex.combined.GWAS.tsv.gz



##### Load files, format to .munge.gz formatting. Update --N numbers, colnames accordingly #####
#HLeur filtered
 file='HP.sex.combined.GWAS.tsv'
 
LC_ALL=C join -1 1 -2 10  <(awk '{print $1}' /home/genetics/LDSC/w_hm3.snplist.sorted | LC_ALL=C sort -k1b,1 ) <(zcat "$file".gz | LC_ALL=C sort -u -k10b,10 ) > "$file".gz.short


python2 /home/genetics/LDSC/ldsc-master/munge_sumstats.py --chunksize 500000 --sumstats "$file".gz.short --N 501825 --a1 effect_allele --a2 other_allele --out "$file".gz.munge.gz
 
 
###### Run univariate LDSC: #####
## for univar LDSC
 python2    /home/genetics/LDSC/ldsc-master/ldsc.py \
 --h2 "$file".gz.munge.gz.sumstats.gz \
 --ref-ld-chr /home/genetics/LDSC/eur_w_ld_chr/ \
 --w-ld-chr  /home/genetics/LDSC/eur_w_ld_chr/ \
 --out "$file".ldsc.log
 
 
 ###### check liability scale 
## for univar LDSC -- liab scale h2?
 python2    /home/genetics/LDSC/ldsc-master/ldsc.py \
 --h2 "$file".gz.munge.gz.sumstats.gz \
 --ref-ld-chr /home/genetics/LDSC/eur_w_ld_chr/ \
 --w-ld-chr  /home/genetics/LDSC/eur_w_ld_chr/ \
 --samp-prev 0.29 \
 --pop-prev 0.30 \
 --out "$file".liab.ldsc.log
 
 
 

 