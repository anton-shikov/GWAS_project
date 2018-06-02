# -*- coding: utf-8 -*-
"""
Created on Sun May 20 02:43:06 2018

@author: anton
"""

import csv

csvwfile = open('C:\\Downloads\\Clustered_slide_clip_09.bed', 'w',newline='')
my_writer = csv.writer(csvwfile, delimiter='\t')


with open('C:\\Downloads\\Clustered_slide_clip_09.tsv',newline='') as csvfile:
    my_reader = csv.reader(csvfile, delimiter='\t')
    for row in my_reader:
        row_to_write = row
        row_to_write[0] = "chr"+str(row [0])
        row_to_write[1] = int(row[1])-1000
        row_to_write[2] = int(row[1])+1000
        row_to_write[3] = row[4]
        row_to_write.pop(4)
        print(row_to_write)
        my_writer.writerow(row_to_write)