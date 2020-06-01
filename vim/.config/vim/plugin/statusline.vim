scriptencoding utf-8

if has('statusline')
	highlight User1 ctermfg=250 ctermbg=1
	highlight User2 ctermfg=245 ctermbg=236
	highlight User3 cterm=bold ctermfg=250 ctermbg=236
	highlight User4 cterm=italic ctermfg=240 ctermbg=236
	highlight User5 ctermfg=1 ctermbg=236
	highlight User6 ctermfg=0 ctermbg=6
	highlight User7 ctermfg=6 ctermbg=236
	set statusline=%1*         " use User1 highlight
	set statusline+=%3n        " buffer number
	set statusline+=\          " space
	set statusline+=%5*        " highlight User5 (User1->User2) for the glyph
	set statusline+=          " powerline glyph
	set statusline+=%*         " reset highlight to default
	set statusline+=\          " space
	set statusline+=%<         " truncate here
	set statusline+=%2*        " highlight User2
	set statusline+=%.30{statusline#fileprefix()}    " file path wihtout filename
	set statusline+=%3*        " highlight User3
	set statusline+=%{statusline#filesuffix()}    " filename
	set statusline+=%*         " reset highlight
	set statusline+=\          " space
	set statusline+=%4*        " highlight User4

	" [ filetype, modifable flag ]
	set statusline+=%([%{statusline#filetype()}%M]%)
	set statusline+=%*         " reset highlight

	" right side
	set statusline+=%=
	set statusline+=%7*        " highlight User7 (User2->User6) for the glyph
	set statusline+=          " powerline glyph
	set statusline+=%6*        " use User6 highlight
	set statusline+=\          " space
	if exists('b:word_count')
		set statusline+=%{statusline#words()}
		set statusline+=\          " space
	endif
	set statusline+=%(%l:%c%)  " line and column
	set statusline+=\          " space
endif
