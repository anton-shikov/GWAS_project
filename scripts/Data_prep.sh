for name in $(ls -Al | awk '$9!="Data_prep.sh" && $9!="altered" {print $9}')
do
echo $name
title=$(echo $name | grep -o -P '.{1,}a' | sed 's/\.a//')
awk -vtable="$title" '{print $1"\t"$2"\t"table"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"1}' $name > altered/$name
done
