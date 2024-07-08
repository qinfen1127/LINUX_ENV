TIME_SCALE = 1ns/1ps
CM         = -cm line+cond+fsm+branch+tgl
CM_HIER    = -cm_hier cov.cfg
CM_DIR     = -cm_dir  simv.vdb
FLIST      = ./flist.f

VCS_COV_OPTIONS = -timescale=$(TIME_SCALE)\
				  -sverilog\
				  -debug_access\

VCS_SIM_OPTIONS = $(CM)\
	          $(CM_DIR)

CLEAN_THESE =csrc simv simv.daidir novas.* ucli.key *.log *.fsdb *.vcd vfastLog
clean:
	rm -rf $(CLEAN_THESE)
comp:
	vcs -full64 -f $(FLIST)  $(VCS_COV_OPTIONS)  
sim:
	./simv
fsdb:
	Verdi -sv  -ssf test.fsdb -f $(FLIST) &
urg:
	urg -full64 -dir simv.vdb -report cover
vcs:clean comp sim

all:clean comp sim fsdb

