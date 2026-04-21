if exists("g:loaded_y") || &cp
	finish
endif
let g:loaded_y = 1

nnoremap y% :call <SID>hints()<CR>:Y %:

command -nargs=1 Y call s:y(<q-args>)

function s:y(fnmods)
	let f = expand(a:fnmods)

	if empty(f)
		echo 'No filename to yank'
		return
	endif

	let @" = f

	let regs = split(&clipboard, ',')
	if index(regs, 'unnamed') >= 0
		let @* = f
	endif
	if index(regs, 'unnamedplus') >= 0
		let @+ = f
	endif
endfunction

function s:hints()
	echo '(:help filename-modifiers)'
	for c in ['t', '.', '~', 'p', 'h', '~:h', 'p:h']
		let fnmod = '%:'..c
		echo fnmod.."\t"..expand(fnmod)
	endfor
endfunction
