set FLIST_PATH ../../../design/filelist/dc_flist.f
set ffd [open "$FLIST_PATH" r]
set FILELIST [list]
set INC_PATH [list]

while {![eof $ffd]} {
    [gets $ffd ffdline]
	set ffdmatch [regexp {^\+} $ffdline]
	if { $ffdmatch } {
		set nline [string range $ffdline 8 end]
		lappend INC_PATH $nline
	} else {
		lappend FILELIST $ffdline
	}
	
	puts stdout $ffdline
}

close $ffd


