#!/bin/python3
#----------------------------------------------------------------------------------------------
# Author   :  Howard
# Date     :  2024-02-24
# Mail     :  qinfen1127@163.com
# Function :  Count the number of code lines
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# import lib
#----------------------------------------------------------------------------------------------
import re
import os
import sys

#----------------------------------------------------------------------------------------------
# subfunction-count single verilog lines
#----------------------------------------------------------------------------------------------
def file_line_count(rtl):
    with open(rtl,'r') as file:
        lines = file.readlines()
    
    code_lines      = 0
    code_line       = 0
    range_demotion  = 0
    
    for line in lines:
        line = line.strip()
        
        if line.startswith('//') or line =='' :
            continue

        if line.startswith('/*') and line.endswith('*/') :
            continue

        if line.startswith('/*') :
            range_demotion = 1
            continue
        
        if line.endswith('*/') :
            range_demotion = 0
            continue

        if range_demotion == 0 :
            code_line +=1
            #print(line)
    
    #print(code_line)
    return code_line, os.path.basename(rtl)

#----------------------------------------------------------------------------------------------
# subfunction-count filelist verilog lines
#----------------------------------------------------------------------------------------------
def filelist_line_count(filelist):
    file_name  = []
    file_count = []
    for rtl in filelist:
        tmp_count, tmp_name = file_line_count(rtl)
        file_name.append(tmp_name)
        file_count.append(tmp_count)

    max_filename_length = max(len(filename) for filename in file_name)
    line_count_all = 0
    with open('rtl_lines.txt', 'w') as output:
        for filename in file_name:
            line_count = file_count[file_name.index(filename)]
            line_count_all += line_count
            output.write(f"{filename.ljust(max_filename_length+1)}: {line_count}\n")
        output.write(f"file : {len(file_name)} total : {line_count_all}")

#----------------------------------------------------------------------------------------------
# subfunction-filter filelist file
#----------------------------------------------------------------------------------------------
def filelist_filter(filelist):
    with open(filelist,'r') as file:
        lines = file.readlines()
    
    lines_filter = []
    
    for line in lines:
        line = line.strip()

        if line.startswith('//') or line =='' or line.startswith('+define+') or line.startswith('+incdir+'):
            continue

        line = line.split()[0]
        lines_filter.append(line)

    with open('filelist.flt', 'w') as output:
        for line in lines_filter:
            output.write(line + '\n')

    return lines_filter

#----------------------------------------------------------------------------------------------
# main function
#----------------------------------------------------------------------------------------------
if __name__ == '__main__':
    tmp_count, tmp_name = file_line_count(sys.argv[1])
    print(tmp_name+" : "+str(tmp_count))
