"set telescope.defaults.initial_mode=normal

nnoremap <Space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Space>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Space>f :lua require('telescope.builtin').find_files({find_command = {'fd', vim.fn.expand("<cword>")}})<CR>
nnoremap <Space>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <Space>b :lua require('telescope.builtin').buffers({ ignore_current_buffer = true, sort_mru = true } )<CR>
"nnoremap <Space>vh :lua require('telescope.builtin').help_tags()<CR>

lua << EOF
require('telescope').setup{
  defaults = {
    initial_mode = "normal",
  }
}

EOF
