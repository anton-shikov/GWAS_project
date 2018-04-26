 awk -F '[:\t]' 'NR>1 {print $1"\t"$2"\t"$5"\t"$6"\t"$14}' all_for_plot.tsv |  sort -t $'\t' -b -n  -k1,1 -k2,2 | grep -v 'e\|6315935' > Manhattan.tsv
