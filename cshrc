#===========================================================================================================================
#   @File Name  :  /home/haoran/.cshrc
#   @File Type  :  csh
#   @Author     :  Howard
#   @E-mail     :  qinfen1127@163.com
#   @Date       :  2024-05-30
#   @Function   :  config csh operation
#===========================================================================================================================

#----------------------------------------------------------------------------------------------------------------------
#  tools source
#----------------------------------------------------------------------------------------------------------------------
#source  /lsf/conf/cshrc.lsf
#module  load    python/3.8.2
#module  unload  python/3.8.2
#module  av  
#module  list

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
alias     jy.tar    "tar -xvf"  # jy.tar    test.tar
alias     ys.tar    "tar -cvf"  # jy.tar    test.tar test1 test2

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
alias     mc        "mkdir \!*;cd \!*"
alias     la        "ls -a"
alias     lh        "ls -lh"
alias     dx        "du -sh"
alias     dxa       "du -sh *"
alias     wo        "whoami"
alias     gch       "gvim /etc/csh.cshrc"
alias     sch       "source /etc/csh.cshrc"
alias     fh        "cd -"
alias     c         "clear"
alias     h         "history"
alias     py3       "python3"

#----------------------------------------------------------------------------------------------------------------------
#  set prompt
#----------------------------------------------------------------------------------------------------------------------
#alias     setprompt 'set prompt="%B%T[${cwd}/]>"'
#alias     setprompt 'set prompt="%B[${cwd}/]\"$'
alias     setprompt 'set prompt="%B[${cwd}/]\>"'
alias     cd        'chdir \!* && setprompt;ls'

#----------------------------------------------------------------------------------------------------------------------
#  su user
#----------------------------------------------------------------------------------------------------------------------
alias     rt        "su root"
if (! $?my_name) then
  setenv    my_name `whoami`       
endif
alias     sm        "su $my_name"

#----------------------------------------------------------------------------------------------------------------------
#  git command
#----------------------------------------------------------------------------------------------------------------------
alias     gad       "git add"
alias     gst       "git status"
alias     grm       "git rm -r"
alias     gmv       "git mv"
alias     gcm       "git commit -m"
alias     gps       "git push origin main"
alias     gbh       "git branch"
alias     gpl       "git pull"
alias     gcl       "git clone"
alias     gco       "git checkout"         #before git add    |     .-discard all  |      xxx-only discard xxx
alias     grt       "git reset HEAD"       #before git commit |      -discard all  |      xxx-only discard xxx
alias     grh       "git reset --hard"     #after  git commit | HEAD^-back forward | commitid-back forward to commitid
alias     gbk       "git reset --hard HEAD^"
alias     glg       "git log"

#----------------------------------------------------------------------------------------------------------------------
#  p4 command
#----------------------------------------------------------------------------------------------------------------------
alias     4op       "p4 open"
alias     4pd       "p4 opened"
alias     4sc       "p4 sync"
alias     4ad       "p4 add"
alias     4st       "p4 submit -d"
alias     4if       "p4 info"
alias     4xr       "source _env/init.csh"
alias     4rt       "p4 revert"
alias     4sm       "p4 stream revert"
alias     4se       "p4 shelve -Af -f -c"
alias     4us       "p4 unshelve -s"

#----------------------------------------------------------------------------------------------------------------------
#  lsf command set
#----------------------------------------------------------------------------------------------------------------------
alias     bsubn     "bsub"
alias     bsubg     "bsub -Ip"

#----------------------------------------------------------------------------------------------------------------------
#  set environment variable
#----------------------------------------------------------------------------------------------------------------------
#setenv    VERDI_HOME /cad/synoposys/verdi/R-2020.12-SP2-9
#setenv    VCS_HOME   /cad/synoposys/vcs/R-2020.12-SP2-9

#----------------------------------------------------------------------------------------------------------------------
#  local script set
#----------------------------------------------------------------------------------------------------------------------
alias     plist       "python3 ~/script/plist.py"
alias     vline       "python3 ~/script/file_line.py"
alias     fline       "python3 ~/script/flist_line.py"
alias     port        "python3 ~/script/port_shell.py"
alias     cps         "~/script/./compress"
alias     pskill      "ps -eLf | grep $my_name | grep simv | awk '{print $2}' | xargs -r kill -9"
alias     psm         "ps -eLf | grep $my_name"
alias     yz_verdi    "bsubg verdi -ssv -ssx -ssy -ssz -ssf"
alias     exec_verdi  "bsubg verdi -ssy -ssv -dbdir *.daidir &"
alias     cq          "reboot"
alias     gj          "shutdown"
alias     pdf         "evince"

#----------------------------------------------------------------------------------------------------------------------
#  local script set
#----------------------------------------------------------------------------------------------------------------------
alias     github    "cd ~/github"

#----------------------------------------------------------------------------------------------------------------------
#  set unalias
#----------------------------------------------------------------------------------------------------------------------
unalias   rm
unalias   cp
unalias   mv

#----------------------------------------------------------------------------------------------------------------------
#  source complete
#----------------------------------------------------------------------------------------------------------------------
echo      "source complete"
