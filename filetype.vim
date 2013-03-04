augroup filetypedetect
    au BufNewFile,BufRead *.wiki,*.txt setf moin
    au BufWinLeave * mkview
    au BufWinEnter,BufNewFile,BufRead * silent loadview
augroup END

