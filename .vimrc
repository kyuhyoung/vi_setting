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

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'farmergreg/vim-lastplace'
Plugin 'Yggdroot/indentLine'

Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required

nmap <F5> :NERDTreeToggle<CR>
filetype plugin indent on    " required
"let g:airline_theme='cobalt2'
"let g:airline_theme='luna'
let g:airline_theme='papercolor'
"let g:airline_theme='soda'
"let g:airline_theme='base16_atelier_cave'
"let g:airline_theme='base16_classic'
