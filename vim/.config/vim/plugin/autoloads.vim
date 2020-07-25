" Wait until idle to run boot commands
augroup Idleload
	autocmd!
	if has('vim_starting')
		autocmd CursorHold,CursorHoldI * call autocmds#idleload()
	endif
augroup END

autocmd! User GoyoEnter nested call plugin#goyo#enter()
autocmd! User GoyoLeave nested call plugin#goyo#leave()
