"set telescope.defaults.initial_mode=normal

nnoremap <Space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Space>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Space>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <Space>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <Space>vh :lua require('telescope.builtin').help_tags()<CR>

lua << EOF
require('telescope').setup{
  defaults = {
    initial_mode = "normal",
  }
}

EOF
