#---------------------------------------------------------------------
#  author   : hr_li
#  data     : 2020/3/1
#  function : lib configure script
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#  set lib path
#---------------------------------------------------------------------
set  LPL_PATH           /fhome/icdata/pl_liu/UMC/library/UMC55LP
set  LIB_PATH			$LPL_PATH/UM055LSCEE12BBH-LIBRARY_TAPE_OUT_KIT-Ver.B02_PB/tapeout_kit/synopsys
set  LIB_FILE           u055lscee12bbh_120c25_tc.db

#---------------------------------------------------------------------
#  set flist path
#---------------------------------------------------------------------
set  FLIST_PATH         ../../../design/filelist/dc_flist.f

#---------------------------------------------------------------------
#  set top file
#---------------------------------------------------------------------
set  RTL_TOP_PATH       ../../../design/define/top/rtl_top
set  NET_TOP_PATH       ../../../design/define/top/net_top
set  RTL_TOP_FILE       "[sh ls $RTL_TOP_PATH]"
set  NET_TOP_FILE       "[sh ls $NET_TOP_PATH]"


