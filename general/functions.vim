" Random Useful Functions

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Correct accents
autocmd VimLeave *.tex !acuto %

" Turn spellcheck on for markdown files:
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md,*.tex setlocal spell
augroup END

" Set default language
set spelllang=it
" set spellfile=$HOME/.vim/spell/en.utf-8.add,$HOME/.vim/spell/it.utf-8.add

function! LanguageToggle() abort
  if &l:spelllang == "en"
    " Switch to Italian
    setlocal spelllang=it
    " setlocal spellfile=$HOME/.vim/spell/it.utf-8.add,$HOME/.vim/spell/en.utf-8.add
    echom "Switching to Italian"
  else
    " Switch to English
    setlocal spelllang=en
    " setlocal spellfile=$HOME/.vim/spell/en.utf-8.add,$HOME/.vim/spell/it.utf-8.add
    echom "Switching to English"
  endif
endfunction

" Switch Languages
command! LanguageToggle call LanguageToggle()

" Add word to both spellfiles
nnoremap ,zg zg2zg

" Disables suggestions markdown files
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType tex let b:coc_suggest_disable = 1

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
