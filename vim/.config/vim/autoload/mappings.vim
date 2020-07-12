function mappings#zap()
	let l:pos = getcurpos()
	let l:search = @/
	keepjumps %substitute/\s\+$//e
	let @/ = l:search
	nohlsearch
	call setpos('.', l:pos)
endfunction
