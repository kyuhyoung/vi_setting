"hi Visual  guifg=White guibg=LightBlue gui=none
autocmd InsertEnter,InsertLeave * set cul!
"if has("autocmd")
"	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"	au InsertEnter,InsertChange *
"		\ if v:insertmode == 'i' | 
"		\   silent execute '!echo -ne "\e[6 q"' | redraw! |
"		\ elseif v:insertmode == 'r' |
"		\   silent execute '!echo -ne "\e[4 q"' | redraw! |
"		\ endif
"	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
"endif

"Change cursor shape between insert and normal mode in iTerm2.app
"if $TERM_PROGRAM =~ "iTerm.app"
if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
	let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set list lcs=tab:\|\ 
set paste
set nocompatible     " 오리지날 VI와 호환하지 않음
set autoindent       " 자동 들여쓰기
set cindent          " C 프로그래밍용 자동 들여쓰기
set smartindent      " 스마트한 들여쓰기
set wrap
"set nowrapscan       " 검색할 때 문서의 끝에서 처음으로 안돌아감
set nobackup         " 백업 파일을 안만듬
set noswapfile
"set visualbell      " 키를 잘못눌렀을 때 화면 프레시
set ruler            " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set shiftwidth=4     " 자동 들여쓰기 4칸
set number           " 행번호 표시, set nu 도 가능
set fencs=ucs-bom,utf-8,euc-kr.latin1 " 한글 파일은 euc-kr로, 유니코드는 유니코드로
set fileencoding=utf-8 " 파일저장인코딩
set tenc=utf-8       " 터미널 인코딩
set expandtab        " 탭대신 스페이스
set hlsearch         " 검색어 강조, set hls 도 가능
set ignorecase       " 검색시 대소문자 무시, set ic 도 가능
set tabstop=4        " 탭을 4칸으로
set lbr
set incsearch        " 키워드 입력시 점진적 검색
set cursorline       " 편집 위치에 커서 라인 설정
set laststatus=2     " 상태바 표시를 항상한다
set statusline+=%F

"noremap <LeftDrag> <LeftMouse>
"noremap! <LeftDrag> <LeftMouse>


syntax on "  구문강조 사용
hi Visual term=reverse cterm=reverse guibg=Grey
filetype indent on   " 파일 종류에 따른 구문강조
set background=dark  " 하이라이팅 lihgt / dark
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000     " vi 편집기록 기억갯수 .viminfo에 기록
highlight Comment term=bold cterm=bold ctermfg=4 " 코멘트 하이라이트
"set mouse=i          " vim에서 마우스 사용
set mouse=a          " vim에서 마우스 사용
"set ttymouse=xterm2	" vim에서 마우스로 split heigt 조절"
set ttymouse=sgr        " vim에서 마우스로 split heigt 조절 AI challenge 2020 때 접속한 docker에서 .vimrc의 mouse 사용 옵션이 안 먹혀서 헤매던 중 발견. https://github.com/Microsoft/WSL/issues/2183#issuecomment-315881809"
"set mouse=nicr         " vim에서 마우스 사용
set t_Co=256         " 색 조정
"set guicursor=i:ver25-iCursor   " cursor thickness
vmap <C-C> "*y

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endi


" if you're using kitty, urxvt, st, or xterm
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
if !empty($TMUX)
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
endif


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.linuxbrew/opt/fzf

call plug#begin()
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'farmergreg/vim-lastplace'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()            " required


nmap <F5> :NERDTreeToggle<CR>
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
filetype plugin indent on    " required
"let g:airline_theme='cobalt2'
"let g:airline_theme='luna'
let g:airline_theme='papercolor'
"let g:airline_theme='soda'
"let g:airline_theme='base16_atelier_cave'
"let g:airline_theme='base16_classic'
" Auto-reload changed files
set autoread
" set -s set-clipboard on

if (!has('nvim') && !has('clipboard_working'))
    " In the event that the clipboard isn't working, it's quite likely that
    " the + and * registers will not be distinct from the unnamed register. In
    " this case, a:event.regname will always be '' (empty string). However, it
    " can be the case that `has('clipboard_working')` is false, yet `+` is
    " still distinct, so we want to check them all.
    let s:VimOSCYankPostRegisters = ['', '+', '*']
    " copy text to clipboard on both (y)ank and (d)elete
    let s:VimOSCYankOperators = ['y', 'd']
    function! s:VimOSCYankPostCallback(event)
        if index(s:VimOSCYankPostRegisters, a:event.regname) != -1
            \ && index(s:VimOSCYankOperators, a:event.operator) != -1
            call OSCYankRegister(a:event.regname)
        endif
    endfunction
    augroup VimOSCYankPost
        autocmd!
        autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
    augroup END
endif

autocmd FocusGained,BufEnter * checktime

" viminfo 는 보관소에 직접 기록 (심링크는 vim 이 덮어써서 못 씀)
set viminfofile=/NHNHOME/WORKSPACE/26molit001_dbo/kevin/home/.viminfo

" tmux 안에서: 마우스 드래그로 선택한 영역을 놓는 순간 tmux 버퍼로 복사 → 다른 pane에서 Ctrl+V로 붙임
if !empty($TMUX)
    vnoremap <silent> <LeftRelease> y:call system('tmux load-buffer - && tmux save-buffer - <Bar> /NHNHOME/WORKSPACE/26molit001_dbo/kevin/work/etc/scripts/osc52-copy', @0)<CR>gv
endif
