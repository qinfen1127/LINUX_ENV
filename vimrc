"===========================================================================================================================
"   @File Name  :  .vimrc
"   @File Type  :  vimrc
"   @Author     :  Howard
"   @E-mail     :  qinfen1127@163.com
"   @Date       :  2024-05-30
"   @Function   :  config gvim file
"===========================================================================================================================

"----------------------------------------------------------------------------------------------------------------------
"  set gvim syntax
"----------------------------------------------------------------------------------------------------------------------
syntax on
syntax enable
colorscheme desert

"----------------------------------------------------------------------------------------------------------------------
"  set gvim normal
"----------------------------------------------------------------------------------------------------------------------
set number
set guifont=AR\ PL\ UMing\ CN\ 8
set expandtab
set tabstop=2
set nowrap

"----------------------------------------------------------------------------------------------------------------------
" set gvim cross and align
"----------------------------------------------------------------------------------------------------------------------
set cursorline
set cursorcolumn
set ignorecase
set foldenable
set foldmethod=marker
"set smartindent
set autoindent
set autoread
"set spell
set lines=999
set columns=999

"----------------------------------------------------------------------------------------------------------------------
"  set align plugin
"----------------------------------------------------------------------------------------------------------------------
set       nocp
filetype  plugin on





"----------------------------------------------------------------------------------------------------------------------
"  set map BT insert
"----------------------------------------------------------------------------------------------------------------------
map <F1> :call BT1() <cr>dd6ji<end>
map <F2> :call BT2() <cr>dd6ji<end>
map <F3> :call BT3() <cr>dd6ji<end>

map mv :vsp<cr>:gvim ~/.vim/temp/m_verilog.v<cr><C-w>w


func BT1() 
  call append(line(".")+0 , "//==========================================================================================================================")
  call append(line(".")+1 , "//  @File Name  :  ".expand("%"))
  call append(line(".")+2 , "//  @File Type  :  verilog")
  call append(line(".")+3 , "//  @Author     :  Howard")
  call append(line(".")+4 , "//  @E-mail     :  qinfen1127@163.com")
  call append(line(".")+5 , "//  @Date       :  ".strftime("%Y-%m-%d"))
  call append(line(".")+6 , "//  @Function   :  ")  
  call append(line(".")+7 , "//==========================================================================================================================")
  call append(line(".")+8 , "")
  call append(line(".")+9 , "module ".fnamemodify(expand("%"), ":t:r")." #(")
  call append(line(".")+10, "")
  call append(line(".")+11, ")(")
  call append(line(".")+12, "")
  call append(line(".")+13, ");")
  call append(line(".")+14, "")
  call append(line(".")+15, "")
  call append(line(".")+16, "endmodule")
  call append(line(".")+17, "")
endfunc

func BT2() 
  call append(line(".")+0 , "#===========================================================================================================================")
  call append(line(".")+1 , "#   @File Name  :  ".expand("%"))
  call append(line(".")+2 , "#   @File Type  :  csh")
  call append(line(".")+3 , "#   @Author     :  Howard")
  call append(line(".")+4 , "#   @E-mail     :  qinfen1127@163.com")
  call append(line(".")+5 , "#   @Date       :  ".strftime("%Y-%m-%d"))
  call append(line(".")+6 , "#   @Function   :  ")  
  call append(line(".")+7 , "#===========================================================================================================================")
endfunc

func BT3() 
  call append(line(".")+0 , "\"===========================================================================================================================")
  call append(line(".")+1 , "\"   @File Name  :  ".expand("%"))
  call append(line(".")+2 , "\"   @File Type  :  vimrc")
  call append(line(".")+3 , "\"   @Author     :  Howard")
  call append(line(".")+4 , "\"   @E-mail     :  qinfen1127@163.com")
  call append(line(".")+5 , "\"   @Date       :  ".strftime("%Y-%m-%d"))
  call append(line(".")+6 , "\"   @Function   :  ")  
  call append(line(".")+7 , "\"===========================================================================================================================")
endfunc

"----------------------------------------------------------------------------------------------------------------------
"  set map ZS insert
"----------------------------------------------------------------------------------------------------------------------
map <F9>  :call ZS1()<cr>ddji<end>
map <F10> :call ZS2()<cr>ddji<end>
map <F11> :call ZS3()<cr>ddji<end>

func ZS1()
  call append(line(".")+0, "//---------------------------------------------------------------------------------------------------------------------")
  call append(line(".")+1, "// ")
  call append(line(".")+2, "//---------------------------------------------------------------------------------------------------------------------")
endfunc


func ZS2()
  call append(line(".")+0, "#----------------------------------------------------------------------------------------------------------------------")
  call append(line(".")+1, "#  ")
  call append(line(".")+2, "#----------------------------------------------------------------------------------------------------------------------")
endfunc

func ZS3()
  call append(line(".")+0, "\"----------------------------------------------------------------------------------------------------------------------")
  call append(line(".")+1, "\"  ")
  call append(line(".")+2, "\"----------------------------------------------------------------------------------------------------------------------")
endfunc

"----------------------------------------------------------------------------------------------------------------------
"  set ab ZS insert
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
"  set match words
"----------------------------------------------------------------------------------------------------------------------
let b:match_words =
  \ '\<begin\>:\<end\>,' .
  \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
  \ '\<module\>:\<endmodule\>,' .
  \ '\<if\>:\<else if\>:\<else\>,' .
  \ '\<function\>:\<endfunction\>,' .
  \ '`ifdef\>:`else\>:`endif\>,' .
  \ '\<task\>:\<endtask\>,' .
  \ '\<program\>:\<endprogram\>,' .
  \ '\<specify\>:\<endspecify\>'

"----------------------------------------------------------------------------------------------------------------------
"  code clean
"----------------------------------------------------------------------------------------------------------------------
map tl 10o<Esc>9k
map th 10o<Esc>9k
map tc :call Clear()<cr>
":'<,'>    
map tk : s/ \[.*\]\s*/\=strpart(submatch(0).repeat(' ',35),0,35)/g<cr>
map ts : %s/^\(\s*reg\)\s*\(\[................................\)\s*\(.*\)$/\1    \2 \3/g<cr>
     \ : %s/^\(\s*wire\)\s*\(\[................................\)\s*\(.*\)$/\1    \2 \3/g<cr>
     \ : %s/^\(\s*reg\)\s*\(\w.*\)$/\1                                      \2/g<cr>
     \ : %s/^\(\s*wire\)\s*\(\w.*\)$/\1                                     \2/g<cr>



func Clear()
  execute '%s/\v(^\s*\n){2,}/\r/g'
  execute '%s/\t/  /g'
  execute '%s/\s*$//g'

endfunc
"----------------------------------------------------------------------------------------------------------------------
"  emacs configuration
"----------------------------------------------------------------------------------------------------------------------
map fg :call Emacs_gen()<cr> 
map fd :call Emacs_del()<cr> 

function Emacs_gen()
  !emacs --batch --no-site-file -l ~/.vim/verilog-mode.el % -f verilog-batch-auto -f save-buffer
endfunc

function Emacs_del()
  !emacs --batch --no-site-file -l ~/.vim/verilog-mode.el % -f verilog-batch-delete-auto -f save-buffer
endfunc

"----------------------------------------------------------------------------------------------------------------------
"  vim command configuration
"----------------------------------------------------------------------------------------------------------------------
map J     10jzz
map H     10h
map <C-h> 0
map L     10l
map <C-l> $
map <C-j> 5jzz
map K     10kzz
map <C-k> 5kzz
map qw    :wq<cr>
map qt    :q<cr>
map qs    :w<cr>

"----------------------------------------------------------------------------------------------------------------------
"  windows operation
"----------------------------------------------------------------------------------------------------------------------
map fv    :vsp<cr>
map fs    :sp<cr>
map fh    <C-w>h
map fj    <C-w>j
map fk    <C-w>k
map fl    <C-w>l

"----------------------------------------------------------------------------------------------------------------------
"  file windows
"----------------------------------------------------------------------------------------------------------------------
let g:treeExplVertical=1
let g:treeExplDirSort=1
let g:treeExplWinSize=40
map wf    :VSTreeExplore<cr>

"----------------------------------------------------------------------------------------------------------------------
"  label swith
"----------------------------------------------------------------------------------------------------------------------
map gj 1gt
map gk 2gt
map gl 3gt

