if exists("g:loaded_y") || &cp
	finish
endif
let g:loaded_y = 1

nnoremap y. :Y .<CR>
nnoremap y~ :Y ~<CR>
nnoremap y/ :Y p<CR>

command -nargs=1 Y call s:y(<q-args>)

function s:y(mod)
	" :help filename-modifiers
	let f = expand('%:'..a:mod)

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

	echo 'Yanked' f
endfunction
