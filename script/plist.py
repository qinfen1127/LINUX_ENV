#!/bin/python3
#----------------------------------------------------------------------------------------------
# Author   :  Howard
# Date     :  2024-02-24
# Mail     :  qinfen1127@163.com
# Function :  list all path file
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# import lib
#----------------------------------------------------------------------------------------------
import os
import sys

#----------------------------------------------------------------------------------------------
# find all file including child-file
#----------------------------------------------------------------------------------------------
def get_filelist(dir,filelist):
  newdir = dir
  if os.path.isfile(dir):
    filelist.append(dir)
  elif os.path.isdir(dir):
    for s in os.listdir(dir):
      newdir=os.path.join(dir,s)
      get_filelist(newdir,filelist)

#----------------------------------------------------------------------------------------------
# print all filelist
#----------------------------------------------------------------------------------------------
def list_print(filelist):
  for i in range(len(filelist)):
    print(filelist[i])

#----------------------------------------------------------------------------------------------
# filter file depending on post_name
#----------------------------------------------------------------------------------------------
def list_flter(filelist,post_name):
  for i in range(len(filelist)):
    if filelist[i].split(".")[len(filelist[i].split("."))-1] == post_name :
      print(filelist[i])

#----------------------------------------------------------------------------------------------
# judge parameter
#----------------------------------------------------------------------------------------------
def para_num(filelist):
  if len(sys.argv) < 2:
    list_print(filelist)
  elif len(sys.argv) > 2:
    print("Parameter amount not correct!!!")
    sys.exit()
  else:
    list_flter(filelist,sys.argv[1])

# run main function
if __name__ == '__main__':
  filelist=[]
  get_filelist(os.getcwd(),filelist)
  para_num(filelist)
