function deadkeys#toggle()
	if !exists('g:deadkeys_on')
		let g:deadkeys_on = 0
	endif
	if !g:deadkeys_on
		call deadkeys#turnon()
	else
		call deadkeys#turnoff()
	endif
endfunction

function deadkeys#turnon()
	echo "Dead Keys: On"
	let g:deadkeys_on=1
	" bound keys
	inoremap ~a à
	inoremap ~e è
	inoremap ~u ù
	inoremap 'e é
	inoremap ^a â
	inoremap ^e ê
	inoremap ^u û
	inoremap ^i î
	inoremap ^o ô
	inoremap ,c ç
	inoremap ~A À
	inoremap ~E È
	inoremap 'E É
	inoremap ^A Â
	inoremap ^E Ê
	inoremap ^U Û
	inoremap ^I Î
	inoremap ^O Ô
	inoremap ,C Ç
endfunction

function deadkeys#turnoff()
	echo "Dead Keys: Off"
	let g:deadkeys_on=0
	" unbound keys
	iunmap ~a
	iunmap ~e
	iunmap ~u
	iunmap 'e
	iunmap ^a
	iunmap ^e
	iunmap ^u
	iunmap ^i
	iunmap ^o
	iunmap ,c
	iunmap ~A
	iunmap ~E
	iunmap 'E
	iunmap ^A
	iunmap ^E
	iunmap ^U
	iunmap ^I
	iunmap ^O
	iunmap ,C
endfunction
