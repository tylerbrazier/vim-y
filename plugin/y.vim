if exists("g:loaded_y") || &cp
	finish
endif
let g:loaded_y = 1

nnoremap y% :call <SID>hints()<CR>:Y %:
nnoremap y. :call <SID>hints(line('.'))<CR>:.Y %:

command -count -nargs=1 Y call s:y(<q-args>, <count>)

function s:y(fnmods, line)
	let f = expand(a:fnmods)

	if empty(f)
		echo 'No filename to yank'
		return
	endif

	if !empty(a:line)
		let f ..= ':'..a:line
	endif

	let @" = f

	let regs = split(&clipboard, ',')
	if index(regs, 'unnamed') >= 0
		let @* = f
	endif
	if index(regs, 'unnamedplus') >= 0
		let @+ = f
	endif

	redraw " avoid the 'Press ENTER ...' prompt
	echo 'Yanked' f
endfunction

function s:hints(line=0)
	echo '(:help filename-modifiers)'
	for c in ['t', '.', '~', 'p', 'h', '~:h', 'p:h']
		let fmod = '%:'..c
		echo fmod.."\t"..expand(fmod)
				\..(!empty(a:line) ? ':'..a:line : '')
	endfor
endfunction
