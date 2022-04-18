let maplocalleader = '\'

let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

if !functions#ispackageloaded('Nvim-R')
	packadd Nvim-R
endif
