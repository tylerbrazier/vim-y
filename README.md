# vim-y

- `y%` to yank the current filename
- `y.` to include the current line number

The first mapping starts:

    :Y %:

the argument is a
[filename-modifier](https://neovim.io/doc/user/cmdline/#filename-modifiers)
e.g.

- `:Y %:.` yanks the path relative to cwd
- `:Y %:~` yanks the path from home dir
- `:Y %:t` (tail) yanks filename only (no path)

`:[count]Y` will append the line number e.g.:

    :.Y %:t

while editing `readme.txt` on line 7 would yank `readme.txt:7`
(`count` of `.` refers to the current line). The `y.` mapping starts:

    :.Y %:
