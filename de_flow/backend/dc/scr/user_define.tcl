
#   --================================CSMT CO. LTD.=============================--
#   Information contained in this Confidential and Proprietary work has been
#                            obtained by CSMT CO LTD 
#   This Software may be used only as authorized by a licensing agreement from
#                                  CSMT Limited
#
#                   COPYRIGHT (C) 2010-2018CSMT DESIGN Limited
#                              ALL RIGHTS RESERVED
#
#   The entire notice above must be displayed on all authorized CSMT copies.
#       Copies may be made only to the extended consent by a licensing
#                          agreement from CSMT Limited.
#
#   ------------------------------------------------------------------------------
#   Project and Control Information
#   ------------------------------------------------------------------------------
#   File Name    : user_define.tcl
#   Version      : 0.1
#   Date         : 2018/11/22
#   Author       : Peter
#   Features     : User Define Variables for Synthesis Template
#   Changes      : 
#   ------------------------------------------------------------------------------

# 1: specify paths, you don't have to modify it unless there are special needs.
set INCLUDE_PATH ../hdl/
set SCRIPT_PATH  ../scr/
set NETLIST_PATH ../net/
set REPORT_PATH  ../rpt/
set DDC_PATH     ../ddc/
set SDC_PATH     ../sdc/
set SDF_PATH     ../sdf/

# 2: set rtl include file
#set RTL_INCLUDE ${INCLUDE_PATH}rtl_include.v
#set RTL_INCLUDE ${INCLUDE_PATH}flist.f

# 3: specify version
set VER _1

# 4: specify top module name 
set top atim ;#Need Modify

# 5: specify whether ungroup large mudules : [ enable | disable ]
set UNGROUP_LARGE_MODULE disable

# 5.1: specify module name to ungroup if UNGROUP_LARGE_MODULE is "enable"
set UNGROUP_MODULES { core8051  }

# 6: specify whether insert clock_gating : [ true | false ]
set INSERT_CG true

# 6.1: set clock_gating insert variables if INSERT_CG is "true"
set CG_MIN_BITWIDTH 3
set CG_MAX_FANOUT   32
set CG_SETUP_VALUE  0.3
set CG_HOLD_VALUE   0.2
set CG_SEQ_CELL latch ; # [ none | latch ]
set CG_POS_CELL_LIST {and} ; # if "none"  : [ {integrated} | {or} ]
                                 # if "latch" : [ {integrated} | {and} ]
set CG_NEG_CELL_LIST {or} ;  # if "none"  : [ {integrated} | {and} ]
                                 # if "latch" : [ {integrated} | {or} ]
set CG_CONTROL_POINT before ; # [ none | before | after ]
set CG_CONTROL_SIGNAL scan_enable ; # [ test_mode | scan_enable ]

# 7: set clock_gating_check variables
set CG_SETUP_CHECK 0.3
set CG_HOLD_CHECK  0.2

# 8: specify whether enable set_dont_use : [ enable | disable ]
set DONT_USE false 

# 8.1: specify cells that you don't want to use if DONT_USE is "enable"
set DONT_USE_CELL {ss_1v62_125c/CLK* \
                   ss_1v62_125c/*XLM \
                   standard.sldb/DW01_add/rpl \
                   standard.sldb/DW01_addsub/rpl \
                   standard.sldb/DW01_sub/rpl \
                   standard.sldb/DW01_inc/rpl \
                   standard.sldb/DW01_incdec/rpl \
                   standard.sldb/DW01_dec/rpl \
                   }

# 9: specify whether enable set_dont_touch : [ enable | disable ]
set DONT_TOUCH disable

# 9.1: set dont touch cell/module if DONT_TOUCH is "enable"
set DONT_TOUCH_CELL {uHWD32F769/uCgu/uCguGck/u11 uHWD32F769/uCgu/uCguGck/u12 \
                     uHWD32F769/uCgu/uCguGck/u13 uHWD32F769/uCgu/uCguGck/u14 \
                    }

# 10: if there are pad io cell, set it as true : [ true | false ]
set PAD_IO_EXIST false

# 10.1: specify pad io if PAD_IO_EXIST is "true"
set PAD_IO {uPad/uTm uPad/uTVDD uPad/uTVPP \
            uPad/uClkScd uPad/uScdRst uPad/uSio}

# 11: if insert dft, set is as true : [ true | false ]
set INSERT_DFT false

# 12: set whether source other constraint file : [ enable | disable ]
set SOURCE_OTHER_CONS disable

# 12.1: specify other constraint file if SOURCE_OTHER_CONS is "enable"
set OTHER_CONS_FILE ${SCRIPT_PATH}other_cons.tcl

