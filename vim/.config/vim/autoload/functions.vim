function functions#ispackageloaded(packname)
	silent let s:scriptpath = split(execute('scriptnames'),'\n')
	for s:path in s:scriptpath
		if match(s:path, 'pack/.*/'.a:packname.'/') != -1
			return 1
		endif
	endfor
	return 0
endfunction

function functions#plaintext()
	setlocal spell
	setlocal tw=0
	setlocal wrap
	setlocal wrapmargin=0

	nnoremap j gj
	nnoremap k gk
endfunction

function functions#foldtext()
	let l:numlines = v:foldend - v:foldstart + 1
	let l:textlines = ' [' . l:numlines . 'ℓ] '
	let l:line = getline(v:foldstart)
	let l:text = substitute(l:line, '/\*\|\*/\|{{{', '', 'g')
	return v:folddashes . l:textlines . l:text
endfunction

function functions#aligncomments()
	let l:lastline = line("$")
	let l:tabstop = str2nr(split(execute('set tabstop?'),'=')[1])
	let l:colstart = 1
	let l:lineno = 1
	while l:lineno<=l:lastline
		let l:line = getline(l:lineno)
		let l:shift = (l:tabstop-1)*indent(l:lineno)/l:tabstop
		let l:comm = match(l:line, '" ') + l:shift
		if l:comm>l:colstart
			let l:colstart = l:comm
		endif
		let l:lineno += 1
	endwhile
	let l:lineno = 1
	while l:lineno<=l:lastline
		let l:line = getline(l:lineno)
		let l:col = match(l:line, '" ')
		let l:shift = (l:tabstop-1)*indent(l:lineno)/l:tabstop
		if l:col+l:shift>indent(l:lineno)
			let l:newline = l:line[0 : l:col-1]
			let l:toadd = l:colstart - l:col - l:shift
			let l:newline .= repeat(' ', l:toadd)
			let l:newline .= l:line[l:col : -1]
			call setline(l:lineno, l:newline)
		endif
		let l:lineno += 1
	endwhile
endfunction


