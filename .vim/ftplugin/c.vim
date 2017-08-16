setlocal commentstring=//\ %s

setlocal foldnestmax=1			" Only fold 1 level (e.g. only functions)
setlocal foldmethod=syntax
setlocal tw=100

let c_no_comment_fold = 1

"setlocal makeprg=gcc\ %
"setlocal makeprg=clang\ %\ -o\ %:r

nnoremap <buffer> <leader>r :make<CR>
nnoremap <buffer> <leader>d :YcmCompleter GoTo<CR>

"let g:syntastic_cpp_config_file = '.clang_complete'

"let g:clang_debug = 0
"let g:clang_library_path = "/usr/lib/"
"let g:clang_use_library = 1
"let g:clang_hl_errors = 1
"let g:clang_complete_macros=1
"
"let g:clang_snippets = 1
"let g:clang_snippets_engine='ultisnips'

" SuperTab completion fall-back 
"let g:SuperTabDefaultCompletionType='<C-X><C-O>'




"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
