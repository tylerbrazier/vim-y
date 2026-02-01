if exists("g:loaded_y") || &cp
	finish
endif
let g:loaded_y = 1

nnoremap y% :Y<CR>

command Y call s:y()

function s:y()
	let @" = expand('%')

	let regs = split(&clipboard, ',')
	if index(regs, 'unnamed') >= 0
		let @* = expand('%')
	endif
	if index(regs, 'unnamedplus') >= 0
		let @+ = expand('%')
	endif
endfunction
