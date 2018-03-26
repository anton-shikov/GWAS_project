#wget https://www.dropbox.com/s/x65dbixto5aojg4/1070.assoc.tsv.gz?dl=0 -O 1070.assoc.tsv.gz -O - | gunzip >  1070.assoc.tsv
#awk '$9<5e-08' 1070.assoc.tsv > 1070.assoc.filtered.tsv
#rm -rf 1070.assoc.tsv
counter=0
for link in $(cat links.txt)
do
counter=$((counter+1)) 
name=`awk -v var="$counter" 'BEGIN {RS = "" ; FS = "\n" }{print $var}' names.txt`
del_name=`awk -v var="$counter" 'BEGIN {RS = "" ; FS = "\n" }{print $var}' int_names.txt`
wget $link -O - | gunzip > $del_name
awk '$9<5e-08' $del_name > $name
rm -rf $del_name
done

