# -*- coding: utf-8 -*-
"""
Created on Tue May  8 11:40:57 2018

@author: anton
"""


import csv

csvwfile = open('C:\\Downloads\\Clustered_slide_clip_09.tsv', 'w',newline='')
my_writer = csv.writer(csvwfile, delimiter='\t')
    
csvfile = open ('C:\\Downloads\\Clustered_mahattan_09.tsv')
my_reader = csv.reader(csvfile, delimiter='\t')
start_row = next(my_reader)
max_row = start_row
while(True): 
    try:
        end_row = next(my_reader)
        if end_row[0] != start_row [0]:
            my_writer.writerow(max_row)
            start_row = end_row
            max_row = start_row
        if int(end_row[1])-int(start_row[1]) > 20000000:
            my_writer.writerow(max_row)
            start_row = end_row
            max_row = start_row
        else:
            if int(end_row[4]) > int(max_row[4]):
                max_row = end_row
        print(max_row[4])
    except:
        my_writer.writerow(max_row)
        break
    