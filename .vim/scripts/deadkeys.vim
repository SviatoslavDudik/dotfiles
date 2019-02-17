" Installation
" Add so ~/.vim/scripts/deadkeys.vim to your .vimrc file
" then to map it to any key
" map <F7> :call ToggleDeadKeys()<CR>

let g:DeadKeysOn=0

function! ToggleDeadKeys()
	if !g:DeadKeysOn
		call DeadKeys()
	else
		call DeadKeysOff()
	endif
endfunction

function! DeadKeys()
	echo "Dead Keys: On"
	let g:DeadKeysOn=1
	" bound keys
	imap `a à
	imap `e è
	imap `u ù
	imap 'e é
	imap ^a â
	imap ^e ê
	imap ^u û
	imap ^i î
	imap ^o ô
	imap ,c ç
	imap `A À
	imap `E È
	imap 'E É
	imap ^A Â
	imap ^E Ê
	imap ^U Û
	imap ^I Î
	imap ^O Ô
	imap ,C Ç
endfunction

function! DeadKeysOff()
	echo "Dead Keys: Off"
	let g:DeadKeysOn=0
	" unbound keys
	iunmap `a
	iunmap `e
	iunmap `u
	iunmap 'e
	iunmap ^a
	iunmap ^e
	iunmap ^u
	iunmap ^i
	iunmap ^o
	iunmap ,c
	iunmap `A
	iunmap `E
	iunmap 'E
	iunmap ^A
	iunmap ^E
	iunmap ^U
	iunmap ^I
	iunmap ^O
	iunmap ,C
endfunction
