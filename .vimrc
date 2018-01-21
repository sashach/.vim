" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

"let g:clang_library_path='/usr/local/lib/libclang.so'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'Align'
Plugin 'grep.vim'
Plugin 'vcscommand.vim'
Plugin 'taglist.vim'
Plugin 'lekv/vim-clewn'
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'bash-support.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'corntrace/bufexplorer'
Plugin 'FuzzyFinder'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/unite-outline'
"Plugin 'uarun/vim-protobuf'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'tmhedberg/matchit'
Plugin 'mhinz/vim-startify'
"Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set foldenable
set foldmethod=syntax

colorscheme desert

"==============================================
" Запуск/сокрытие плагина Winmanager
map <F1> :NERDTreeToggle<CR>
imap <F1> <Esc>:NERDTreeToggle<CR>
vmap <F1> <Esc>:NERDTreeToggle<CR>

" Запуск/сокрытие плагина Tag List
map <F2> :TlistToggle<CR>
imap <F2> <Esc>:TlistToggle<CR>
vmap <F2> <Esc>:TlistToggle<CR>

"" Запуск/сокрытие плагина Tag Bar
"map <F3> :TagbarToggle<CR>
"imap <F3> <Esc>:TagbarToggle<CR>
"vmap <F3> <Esc>:TagbarToggle<CR>
"
"" Номера строк
"map <F4> :set number<CR>
"imap <F4> <Esc>:set number<CR>
"vmap <F4> <Esc>:set number<CR>
"
"map <C-F4> :set nonumber<CR>
"imap <C-F4> <Esc>:set nonumber<CR>
"vmap <C-F4> <Esc>:set nonumber<CR>


" Показать список совпадений слова в позиции курсора и предложить возможность
" быстрого перехода на любое из них
map <F5> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Открыть окно сообщений 
map <F6> :cw<CR>
imap <F6> <Esc>:cw<CR>
vmap <F6> <Esc>:cw<CR>
" Закрыть окно сообщений 
map <S-F6> :cclose<CR>
imap <S-F6> <Esc>:cclose<CR>
vmap <S-F6> <Esc>:cclose<CR>

" <F7> - Encoding Menu

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N
" выключить подсветку: повесить на горячую клавишу Ctrl-F8
nnoremap <S-F8> :nohlsearch<CR>


"" Make
"map <F9> :make<CR>
"imap <F9> <Esc>:make<CR>
"vmap <F9> <Esc>:make<CR>
"
"" Format source 
"map <C-F11> <ESC>ggVG=<cr>
"imap <C-F11> <ESC>ggVG=<cr>i
"vmap <C-F11> <ESC>ggVG=<cr>

" Header <-> Source switch
map <S-F12> :A<cr>
imap <S-F12> <ESC>:A<cr>i
vmap <S-F12> <ESC>:A<cr>i

" Buffer Explorer
nmap <A-0>  \be
imap <A-0>  <ESC>\be
vmap <A-0>  <ESC>\be

" sw
"nmap <C-tab> :tabnext<cr> 
"imap <C-tab> <ESC>:tabnext<cr>i 
"
"map <S-tab> :tabprevious<cr> 
"imap <S-tab> <ESC>:tabprevious<cr>i 

nmap <S-T> :tabnew<cr> 

"For saving edited file with sudo
cmap w!! %!sudo tee > /dev/null %


" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
    " а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
    " Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
    " привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

"==============================================
" for Fuf
nmap \fb :FufBuffer<CR> 
nmap \ff :FufFile<CR>
nmap \fr :FufFile **/<CR>
nmap \fw :FufFile ../../wxwin-cp/**/<CR>
nmap \ftb :FufTag<CR>
nmap \ft :FufBufferTag<CR>

"==============================================

" Меню Encoding -->
" Выбор кодировки, в которой читать файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utF9 <CR>
menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
map <F7> :emenu Encoding.Read.<TAB>
" Выбор кодировки, в которой читать файл <--

" Выбор кодировки, в которой сохранять файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utF9 <CR>
menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
map <S-F7> :emenu Encoding.Write.<TAB>
" Выбор кодировки, в которой сохранять файл <--

" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
set wildmenu
set wcm=<Tab>
menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
map <C-F7> :emenu Encoding.End_line_format.<TAB>
" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
" Меню Encoding <--


" Задаем собственные функции для назначения имен заголовкам табов -->
function! MyTabLine()
    let tabline = ''

    " Формируем tabline для каждой вкладки -->
        for i in range(tabpagenr('$'))
            " Подсвечиваем заголовок выбранной в данный момент вкладки.
            if i + 1 == tabpagenr()
                let tabline .= '%#TabLineSel#'
            else
                let tabline .= '%#TabLine#'
            endif

            " Устанавливаем номер вкладки
            let tabline .= '%' . (i + 1) . 'T'

            " Получаем имя вкладки
            let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
        endfor
    " Формируем tabline для каждой вкладки <--

    " Заполняем лишнее пространство
    let tabline .= '%#TabLineFill#%T'

    " Выровненная по правому краю кнопка закрытия вкладки
    if tabpagenr('$') > 1
        let tabline .= '%=%#TabLine#%999XX'
    endif

    return tabline
endfunction

function! MyTabLabel(n)
    let label = ''
    let buflist = tabpagebuflist(a:n)

    " Имя файла и номер вкладки -->
        let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

        if label == ''
            let label = '[No Name]'
        endif

        let label .= ' (' . a:n . ')'
    " Имя файла и номер вкладки <--

    " Определяем, есть ли во вкладке хотя бы один
    " модифицированный буфер.
    " -->
        for i in range(len(buflist))
            if getbufvar(buflist[i], "&modified")
                let label = '[+] ' . label
                break
            endif
        endfor
    " <--

    return label
endfunction

function! MyGuiTabLabel()
    return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()
" Задаем собственные функции для назначения имен заголовкам табов <--

" Просмотр нетекстовых файлов в Vim -->
    au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
    au BufReadPost *.doc silent %!antiword "%"
    au BufReadPost *.odt silent %!odt2txt "%"
" Просмотр нетекстовых файлов в Vim <--

" Переопределение команды make
    "set makeprg=make\ --directory=/home/sasha/projects/wxwin-cp/build/wxwin-cp


" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=4
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent

set sw=4
set fdc=2  

set nocp

filetype plugin on
" =========================================================
" for reding old DOS PAscal sources
au BufNewFile,BufRead *.PAS set filetype=pascal
" =========================================================

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell

" Включить подсветку невидимых символов
"setlocal list
" Настройка подсветки невидимых символов
setlocal list listchars=tab:>-,trail:·
set listchars+=precedes:<,extends:>
set fillchars=fold:-

set incsearch
set ignorecase
set infercase
set hlsearch

" Размер табуляции
set tabstop=4
set smarttab
set expandtab

:let Grep_Default_Path = '~/projects/'
:let Grep_Default_Filelist = '*.h *.cpp *.PAS'
:let Grep_Default_Options = '-R' 
:let Grep_Skip_Dirs = '.svn lib for_fvn'
:let Grep_Skip_Files = '*.bak *~'

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" просматриваем ман-страницы в отдельном окне vim'a с подсвечиванием и т.п.
" Эта директива должна быть в начале файла .vimrc, иначе она перезапишет
" остальные настройки.
"-------------------------------------------------------------------------
" :Man man
:runtime! ftplugin/man.vim

" Выводим красиво оформленную man-страницу прямо в Vim
" в отдельном окне (см. начало этого файла)
nmap <S-k> :exe ":Man " expand("<cword>")<CR>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Настройки для Tlist (показвать только текущий файл в окне навигации по  коду)
let g:Tlist_Show_One_File = 1

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t
" Функция для переключения в режим hex-редактора

command -bar Hexmode call ToggleHex()

function ToggleHex()
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    let b:oldft=&ft
    let b:oldbin=&bin
    setlocal binary
    let &ft="xxd"
    let b:editHex=1
    %!xxd
  else
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    let b:editHex=0
    %!xxd -r
  endif
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Переключение в режим hex-редактора

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat 

" change EasyMotion leader key back to <Leader> until I find conflicts
"let g:EasyMotion_leader_key = "\"

"cd ~/projects/wxwin-cp/wxwin-cp/debug

let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_change_to_vcs_root = 1

set guifont=Monospace\ Regular\ 9

function! MyUpdateCtags()
!ctags -R -I --c++-types=+px --c++-kinds=+p --fields=+iaS --sort=yes --extra=+q --excmd=pattern --exclude=Makefile* --exclude=.hg --exclude=tmp --exclude=lib --exclude=*lib* --exclude=*build* --exclude=../../include ../../../wxwin-cp 
endfunction

" Обновление ctags -->
let MyUpdateCtagsFunction = "MyUpdateCtags"
nmap <F11> :call {MyUpdateCtagsFunction}()<CR>

menu ctags.Update<Tab><F11> <F11>
"    set tags+=../wx.tags
"    set tags+=../fdp.tags
" Обновление ctags <--


