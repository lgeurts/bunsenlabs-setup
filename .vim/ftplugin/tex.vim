setlocal nocursorline
setlocal formatoptions=tcq
setlocal textwidth=0
setlocal colorcolumn=0
setlocal spell
setlocal spelllang=en_us
syntax spell notoplevel

let g:tex_comment_nospell= 1

" let g:ycm_semantic_triggers = {
" \  'tex'  : ['{', ':'],
" \ }

let g:ycm_semantic_triggers = {
\  'tex'  : ['{', '\', ':'],
\ }

noremap <buffer> <leader>r :Latexmk<CR>
noremap <buffer> <leader>R :Latexmk!<CR>
noremap <buffer> <leader>v :LatexView<CR>

noremap <buffer> <leader>ls :LatexmkStatus<CR>
noremap <buffer> <leader>lx :LatexmkStop<CR>
noremap <buffer> <leader>lc :LatexmkClean<CR>
noremap <buffer> <leader>le :LatexErrors<CR>

noremap <F4> :LatexTOCToggle<CR>

" let g:LatexBox_custom_indent = 0
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_split_width = 40

" Prevent the quickfix window from stealing the cursor
let g:LatexBox_quickfix = 2

let g:LatexBox_Folding = 1
let g:LatexBox_fold_envs = 1 " dont fold envs only sections
let g:LatexBox_fold_automatic = 1
let g:LatexBox_fold_preamble = 1

let g:LatexBox_viewer = 'zathura'

imap ]] <Plug>LatexCloseCurEnv
imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F6>   <Plug>LatexEnvWrapSelection
vmap <buffer> <F7>   <Plug>LatexWrapSelection

imap <buffer> <F8>   begin<c-j>

iab <buffer> ... \ldots
iab <buffer> -> $\rightarrow$

map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>
