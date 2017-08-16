setlocal spell

" Distraction-less GUI mode
if has("gui_running")
    setlocal background=light
    setlocal nonu
    setlocal noru
    setlocal laststatus=0
    setlocal noshowmode
    colorscheme default
    setlocal nonumber
    setlocal norelativenumber

    " set foldcolum so that the text is centered, get width with :set columns
    setlocal foldcolumn=12
    setlocal linespace=7
    setlocal guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 10
    setlocal tw=80

    hi FoldColumn guibg=white guifg=white
    hi Normal guibg=white
    hi NonText guifg=gray95
    hi CursorLine guibg=gray95
    hi Title gui=bold guifg=gray25
    hi MarkdownHeadingDelimiter gui=bold guifg=gray25
    hi htmlSpecialChar guifg=black
    hi markdownBold gui=bold guifg=gray25
    hi markdownItalic guifg=gray25 gui=italic
    hi markdownUrl guifg=#2fb3a6
    hi markdownAutomaticLink guifg=#2fb3a6
    hi markdownLinkText guifg=#317849
    hi markdownUrlTitle guifg=#317849
    hi markdownBlockquote guifg=#317849 gui=bold
    hi markdownId guifg=#2fb3a6
    hi markdownIdDeclaration guifg=#317849 gui=bold
    hi markdownListMarker guifg=#317849
    hi Cursor guibg=#15abdd
    hi Search  guibg=wheat
    hi MatchParen gui=bold guibg=wheat
endif

" Make selection bold
vmap ,fb S*gvS*

" Make word unter cursor bold
map ,fb viwS*gvS*

" taken from https://gist.github.com/sjl/1038710
func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)

    if l1 =~ '^\s*$'
        " ignore empty lines
        return '='
    endif

    let l2 = getline(a:lnum+1)

    if  l2 =~ '^==\+\s*'
        " next line is underlined (level 1)
        return '>1'
    elseif l2 =~ '^--\+\s*'
        " next line is underlined (level 2)
        return '>2'
    elseif l1 =~ '^#'
        " current line starts with hashes
        return '>'.matchend(l1, '^#\+')
    elseif a:lnum == 1
        " fold any 'preamble'
        return '>1'
    else
        " keep previous foldlevel
        return '='
    endif
endfunc
setlocal foldexpr=Foldexpr_markdown(v:lnum)
setlocal foldmethod=expr
setlocal foldenable
" setlocal foldlevel=0
" setlocal foldcolumn=0
