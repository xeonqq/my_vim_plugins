execute pathogen#infect()
syntax on
filetype plugin indent on

set hlsearch

let g:syntastic_python_flake8_args = "--max-line-length=220"


let mapleader = ","
nnoremap <leader>a :Ack<Space>
nnoremap <leader>n :NERDTree<CR>

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost * :set hls
autocmd BufNewFile,BufReadPost * :set tags+=tags;/


function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
