function functions#ispackageloaded(packname)
	silent let s:scriptpath = split(execute('scriptnames'),'\n')
	for s:path in s:scriptpath
		if match(s:path, 'pack/.*/'.a:packname.'/') != -1
			return 1
		endif
	endfor
	return 0
endfunction
