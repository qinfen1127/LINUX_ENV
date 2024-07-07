#!/bin/python3
#----------------------------------------------------------------------------------------------
# Author   :  Howard
# Date     :  2024-02-24
# Mail     :  qinfen1127@163.com
# Function :  Signal interface statistics
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# import lib
#----------------------------------------------------------------------------------------------
import sys
import re
import csv

w_len = 3
s_len = 30
#----------------------------------------------------------------------------------------------
# judge parameter number
#----------------------------------------------------------------------------------------------
if len(sys.argv) != 4:
    print("parameter number not correct")  
    print("python3 port.py all_signal in_signal out_signal")  
    sys.exit(1)  
else:
    all_signal = sys.argv[1]
    inp_signal = sys.argv[2]
    out_signal = sys.argv[3]

#----------------------------------------------------------------------------------------------
# match pattern
#----------------------------------------------------------------------------------------------
pattern = r'(?P<signal>[\w_]+)\[(?P<start>\d+):(?P<end>\d+)\]|(?P<signal_no_width>[\w_]+)'

#----------------------------------------------------------------------------------------------
# csv header
#----------------------------------------------------------------------------------------------
header = ['signal','inout','width','function']

#----------------------------------------------------------------------------------------------
# function : read file and output
#----------------------------------------------------------------------------------------------
def remove_leading_trailing_spaces(input_file_path):  
    output_file_path = './output.txt'
    with open(input_file_path, 'r') as input_file:  
        with open(output_file_path, 'w') as output_file:  
            for line in input_file:  
                trimmed_line = line.strip()  
                output_file.write(trimmed_line + '\n')

#----------------------------------------------------------------------------------------------
# function : read file and save line to list
#----------------------------------------------------------------------------------------------
def read_file(input_file_path):
    line_list = []
    with open(input_file_path, 'r') as input_file:  
        for line in input_file:
            line_list.append(line.strip().split('.')[-1])
    return line_list

#----------------------------------------------------------------------------------------------
# signal abstract
#----------------------------------------------------------------------------------------------
def signal_abstract(signal_list):
    signal_only = []
    width_only  = []
    for signal in signal_list:
        match = re.match(pattern, signal)
        if match:
            signal_name = match.group('signal') or match.group('signal_no_width')
            start_bit = int(match.group('start')) if match.group('start') else 0
            end_bit = int(match.group('end')) if match.group('end') else 0
            #print(start_bit,end_bit)
            width = start_bit - end_bit + 1
            signal_only.append(signal_name)
            width_only.append(width)
        else:
            print(signal+" not match. Please check the signal")
    return signal_only,width_only

#----------------------------------------------------------------------------------------------
# function : port is in/out/inout
#----------------------------------------------------------------------------------------------
def inout_sort(all_signal,in_signal,out_signal):
    inout_only = []
    for signal in all_signal:
        if signal in in_signal:
            inout_only.append("in")
        elif signal in out_signal:
            inout_only.append("out")
        else:
            inout_only.append("inout")
    return inout_only

#----------------------------------------------------------------------------------------------
# function : print csv file
#----------------------------------------------------------------------------------------------
def csv_print(header,list1,list2,list3,all_uniq,orde_uniq):
    with open('signal_all.csv','w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for i in range(len(list1)):
            row = [list1[i], list2[i], list3[i]]
            writer.writerow(row)

    with open('signal_sam.csv','w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for i in range(len(orde_uniq)):
            row = [all_uniq[i], list2[orde_uniq[i]], list3[orde_uniq[i]]]
            writer.writerow(row)

#----------------------------------------------------------------------------------------------
# function : string unique
#----------------------------------------------------------------------------------------------
def string_unique(string_in):
    replaced_string = re.sub(r'\d', '*', string_in)
    replaced_string = replaced_string.replace('**', '*')
    replaced_string = replaced_string.replace('**', '*')
    return replaced_string

#----------------------------------------------------------------------------------------------
# function : element unique
#----------------------------------------------------------------------------------------------
def element_unique(list_in):
    list_out = []
    orde_out = []
    for i in range(len(list_in)):
        replaced_string = string_unique(list_in[i])

        if replaced_string not in list_out:
            list_out.append(replaced_string)
            orde_out.append(i)

    return list_out, orde_out
#----------------------------------------------------------------------------------------------
# function : output shell rtl file
#----------------------------------------------------------------------------------------------
def shell_rtl(list1, list2, list3):
    with open('module_shell.v', 'w') as f:
        f.write("module module_shell(" + '\n')
        sigma = ","

        for i in range(len(list1)):
            if i == len(list1) - 1:
                sigma = ""
            if list2[i] == "in":
                if list3[i] == 1:
                    f.write("    input       "+" "*(w_len+8) +list1[i].ljust(s_len,' ')+sigma+"\n")
                else:
                    f.write("    input      [" +str(list3[i]-1).rjust(w_len,' ')+":0]     " +list1[i].ljust(s_len,' ')+sigma+"\n")
            elif list2[i] == "out":
                if list3[i] == 1:
                    f.write("    output      "+" "*(w_len+8) +list1[i].ljust(s_len,' ')+sigma+"\n")
                else:
                    f.write("    output     [" +str(list3[i]-1).rjust(w_len,' ')+":0]     " +list1[i].ljust(s_len,' ')+sigma+"\n")
            else:
                if list3[i] == 1:
                    f.write("    inout       "+" "*(w_len+8) +list1[i].ljust(s_len,' ')+sigma+"\n")
                else:
                    f.write("    inout      [" +str(list3[i]-1).rjust(w_len,' ')+":0]     " +list1[i].ljust(s_len,' ')+sigma+"\n")

        f.write(");" + '\n\n\n')

        f.write("`ifndef  HWEMUL\n")
        for i in range(len(list1)):
            if list2[i] == "out":
                f.write("    assign  " +list1[i].ljust(s_len,' ')+ " = " + str(list3[i]).rjust(w_len,' ')+"'d0 ;"+"\n")
        f.write("`endif\n")

        f.write("\n\nendmodule")

# main function
def main():
    all_line = read_file(all_signal)
    inp_line = read_file(inp_signal)
    out_line = read_file(out_signal)

    all_only = signal_abstract(all_line)[0]
    wid_only = signal_abstract(all_line)[1]
    inp_only = signal_abstract(inp_line)[0]
    out_only = signal_abstract(out_line)[0]
    
    iod_list = inout_sort(all_only,inp_only,out_only)

    all_uniq,orde_uniq = element_unique(all_only)

    csv_print(header,all_only,iod_list,wid_only,all_uniq,orde_uniq)
    all_signal_num = len(all_only)
    sam_signal_num = len(all_uniq)
    shell_rtl(all_only,iod_list,wid_only)
    print("all_signal : " + str(all_signal_num))
    print("sam_signal : " + str(sam_signal_num))
    print("column -t -s, signal_all.csv")
    print("column -t -s, signal_sam.csv")

# run main function
if __name__ == '__main__':
    main()
