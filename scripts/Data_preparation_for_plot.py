# -*- coding: utf-8 -*-
"""
Created on Thu Apr 26 14:40:34 2018

@author: anton
"""

import csv

csvwfile = open('C:\\Downloads\\all_for_plot_09.tsv', 'w',newline='')
my_writer = csv.writer(csvwfile, delimiter='\t')
    
csvfile = open ('C:\\Downloads\\merged_sorted_09.tsv')
my_reader = csv.reader(csvfile, delimiter='\t')
for row in my_reader:
    row[1] = ''.join(set(row[1].split("; ")))
    my_writer.writerow(row)