#!/usr/bin/tclsh
#-----------------------------------------------------------------------
#step0 : set filelist path
#-----------------------------------------------------------------------
set  CUR_PATH   [pwd]
set  FILE_LIST  ../../design/filelist/dc_flist.f
set  TOP_PATH   ../../design/define/top/rtl_top

#-----------------------------------------------------------------------
#step1 : find top file
#-----------------------------------------------------------------------
cd   $TOP_PATH
set  TOP_FILE           "[glob -nocomplain *]"
cd   $CUR_PATH

#-----------------------------------------------------------------------
#step2 : create new project
#-----------------------------------------------------------------------
gui_start
new_project m0 -force

#-----------------------------------------------------------------------
#step3 : read rtl  set include path
#-----------------------------------------------------------------------
read_file   -type sourcelist $FILE_LIST

#-----------------------------------------------------------------------
#step4 : set top file
#-----------------------------------------------------------------------
if { $TOP_FILE != "" } {
	set_option  top        $TOP_FILE
	set  run_mode  ""
} else {
	puts "no top_file defined, please define top file"
	set  run_mode  "-alltop"
}


#-----------------------------------------------------------------------
#step5 : other configure
#-----------------------------------------------------------------------
set_parameter handle_large_bus yes
#set_option  hdlin_synthesis_off_skip_text yes
set_option  mthresh                       524289
set_option  enableV05 yes

#-----------------------------------------------------------------------
#step6 : lint check
#-----------------------------------------------------------------------
current_goal  lint/lint_rtl     $run_mode
run_goal

#current_goal  lint/lint_turbo_rtl  -top  $top_file
#run_goal

#-----------------------------------------------------------------------
#step7 : lint check
#-----------------------------------------------------------------------
save_project

