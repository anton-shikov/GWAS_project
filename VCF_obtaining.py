# -*- coding: utf-8 -*-
"""
Created on Sun May 20 02:07:05 2018

@author: anton
"""

import csv
from collections import defaultdict
SNP_dict = defaultdict(list)

csvwfile = open('C:\\Downloads\\Clustered_slide_clip_09.vcf', 'w',newline='')
my_writer = csv.writer(csvwfile, delimiter='\t')

with open('C:\\Downloads\\for_vcf.tsv',newline='') as csvfile:
    my_reader = csv.reader(csvfile, delimiter='\t')
    for row in my_reader:
        SNP_dict[row[2]].append(row[0])
        SNP_dict[row[2]].append(row[1])
with open('C:\\Downloads\\Clustered_slide_clip_09.tsv',newline='') as csvfile:
    my_reader = csv.reader(csvfile, delimiter='\t')
    for row in my_reader:
        row_to_write = row
        for i in range(4):
            row_to_write.append('.')
        row_to_write[8] = row [4]
        row_to_write[3] = SNP_dict[row[2]][0]
        row_to_write[4] = SNP_dict[row[2]][1]
        print(row_to_write)
        my_writer.writerow(row_to_write)
