# -*- coding: utf-8 -*-
"""
Created on Tue May  8 15:02:17 2018

@author: anton
"""
import csv
row_dict = {}

csvwfile = open('C:\\Downloads\\Clust_MAF_file_09.tsv', 'w',newline='')
my_writer = csv.writer(csvwfile, delimiter='\t')

with open('C:\\Downloads\\Clust_var_09.tsv',newline='') as csvfile:
    my_reader = csv.reader(csvfile, delimiter='\t')
    for row in my_reader:
        row_dict[row[0]]= row[1]
        
with open('C:\\Downloads\\Var_MAF.tsv',newline='') as csvfile:
    my_reader = csv.reader(csvfile, delimiter='\t')
    for row in my_reader:
        if row[0] in row_dict.keys():
            cur_line = row
            cur_line.append(row_dict[row[0]])
            print(cur_line)
            my_writer.writerow(cur_line)
            
     