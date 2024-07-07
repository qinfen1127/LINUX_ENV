#===========================================================================================================================
#   @File Name  :  /home/haoran/.cshrc
#   @File Type  :  csh
#   @Author     :  Howard
#   @E-mail     :  qinfen1127@163.com
#   @Date       :  2024-05-30
#   @Function   :  config csh operation
#===========================================================================================================================

#----------------------------------------------------------------------------------------------------------------------
#  set compress and uncompress
#----------------------------------------------------------------------------------------------------------------------









#----------------------------------------------------------------------------------------------------------------------
#  set compress and uncompress
#----------------------------------------------------------------------------------------------------------------------
alias     jy.gz     "gunzip"    # jy.gz     test.gz
alias     ys.gz     "gzip"      # ys.gz     test, test will miss and test only can be file not folder
alias     jy.zip    "unzip"     # jy.zip    test.zip
alias     ys.zip    "zip -r"    # ys.zip    test.zip test
alias     jy.tgz    "tar -xvf"  # jy.tgz    test.tgz
alias     ys.tgz    "tar -czvf" # ys.tgz    test.gz test
alias     jy.tar.gz "tar -xvf"  # jy.tar.gz test.tar.gz
alias     ys.tar.gz "tar -czvf" # ys.tar.gz test.tar.gz test

#----------------------------------------------------------------------------------------------------------------------
#  linux command set
#----------------------------------------------------------------------------------------------------------------------
alias     g         "gvim"
alias     gc        "gvim ~/.cshrc"
alias     gv        "gvim ~/.vimrc"
alias     c1        "cd .."
alias     .         "cd .."
alias     c2        "cd ../.."
alias     ..        "cd ../.."
alias     c3        "cd ../../.."
alias     ...       "cd ../../.."
alias     c4        "cd ../../../.."
alias     sc        "source ~/.cshrc"
alias     fd        "find -name"
alias     cf        "cp -rf"
alias     rf        "rm -rf"
alias     cd        "cd \!*;ls"
alias     la        "ls -a"
alias     lh        "ls -lh"
alias     dx        "du -sh"
alias     dxa       "du -sh *"
alias     wo        "whoami"
alias     rt        "su root"
alias     gch       "gvim /etc/csh.cshrc"
alias     sch       "source /etc/csh.cshrc"

#----------------------------------------------------------------------------------------------------------------------
#  git command
#----------------------------------------------------------------------------------------------------------------------
alias     gad       "git add"
alias     gst       "git status"
alias     grm       "git rm"
alias     gmv       "git mv"
alias     gcm       "git commit -m"
alias     gps       "git push origin main"
alias     gbh       "git branch"
alias     gpl       "git pull"

#----------------------------------------------------------------------------------------------------------------------
#  lsf command set
#----------------------------------------------------------------------------------------------------------------------
alias     bsubn     "bsub"
alias     bsubg     "bsub -Ip"

#----------------------------------------------------------------------------------------------------------------------
#  set environment variable
#----------------------------------------------------------------------------------------------------------------------
setenv    VERDI_HOME /cad/synoposys/verdi/R-2020.12-SP2-9
setenv    VCS_HOME   /cad/synoposys/vcs/R-2020.12-SP2-9

#----------------------------------------------------------------------------------------------------------------------
#  local script set
#----------------------------------------------------------------------------------------------------------------------
alias     plist     "python3 ~/script/plist.py"
alias     pfile     "python3 ~/script/file_line.py"
alias     pflist    "python3 ~/script/flist_line.py"
alias     port      "python3 ~/script/port_shell.py"
alias     cps       "~/script/./compress"
alias     pskill    "ps -eLf | grep haoran | grep simv | awk '{print $2}' | xargs -r kill -9"

#----------------------------------------------------------------------------------------------------------------------
#  source complete
#----------------------------------------------------------------------------------------------------------------------
echo      "source complete"
