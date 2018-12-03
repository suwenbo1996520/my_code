" 默认编码格式
set encoding=utf-8

"取消折叠
set nofoldenable

"自动缩进
set autoindent

"注：ts是tabstop的缩写，设TAB宽4个空格
set ts=4  
set expandtab

"显示行号
"set nu

" 拷贝自work的配置
set ts=4
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
autocmd FileType python set tabstop=4 | set expandtab | set autoindent 
set helplang=cn "中文帮助文档(前提是下了中文包)
syntax enable
syntax on " 自动语法高亮
"set number"显示行号
set guifont=Consolas:h12:cANSI"英文字体
set guifontwide=SimSun-ExtB:h12:cGB2312
set tabstop=4"表示Tab代表4个空格的宽度
set expandtab"表示Tab自动转换成空格
set autoindent"表示换行后自动缩进
set autoread " 当文件在外部被修改时，自动重新读取
set history=400"vim记住的历史操作的数量，默认的是20
set nocompatible"使用vim自己的键盘模式,而不是兼容vi的模式
set confirm"处理未保存或者只读文件时,给出提示
set smartindent"智能对齐
set shiftwidth=4
set softtabstop=4

"将切换vim的自动缩进绑定为F10
set pastetoggle=<F10>

" 一键执行配置
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!time /home/work/software/python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
        endif
endfunc

" 主题配色 molokai
colorscheme  molokai  

set t_Co=256
set background=dark

"插件管理
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
"filetype plugin on


" nerdtree设置 
" 开启关闭快捷键
map <F11> :NERDTreeToggle<CR>
" 关闭最后一个窗口时自动退出目录树
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"代码格式化设置 codefmt插件
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
