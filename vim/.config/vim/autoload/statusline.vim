function statusline#fileprefix()
	let pathlist = split(expand('%'),'/')
	if len(pathlist) < 2
		return ''
	endif
	return join(pathlist[0:-2],'/').'/'
endfunction

function statusline#filesuffix()
	return expand('%:t')
endfunction

function statusline#filetype()
	return &filetype
endfunction

function statusline#words()
	if !exists('b:word_count')
		let b:word_count = 0
	endif
	if b:word_count == 0
		return ''
	endif
	if b:word_count == 1
		return '1 word'
	endif
	return b:word_count . ' words'
endfunction

function statusline#update_wordcount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n += len(split(getline(lnum)))
		let lnum += 1
	endwhile
	let b:word_count = n
endfunction

function statusline#wordcount_start()
	let b:word_count = 0
	augroup wordcounter
		autocmd CursorHold,CursorHoldI * call statusline#update_wordcount()
	augroup END
	source plugin/statusline.vim
endfunction
