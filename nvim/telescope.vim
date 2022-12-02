"set telescope.defaults.initial_mode=normal

nnoremap <Space>s :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Space>ps :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <Space>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <Space>pf :lua require('telescope.builtin').find_files({find_command = {'fd', vim.fn.expand("<cword>")}})<CR>
"nnoremap <Space>j :lua require('telescope.builtin').buffers({ ignore_current_buffer = true, sort_mru = true } )<CR>
"nnoremap <Space>vh :lua require('telescope.builtin').help_tags()<CR>

lua << EOF

vim.api.nvim_set_keymap('n', '<Space>j', ':lua require("telescope.builtin").buffers({ ignore_current_buffer = true, sort_mru = true } )<CR>', { noremap = true })

require('telescope').setup{
defaults = {
    initial_mode = "normal",
    file_ignore_patterns = {"refman/html", "^tags$", "%.dso$", "%.o$", "%.a$", "compile_commands.json", "*.bak$"},
    mappings = {
        n = {
            ["l"] = require('telescope.actions').select_default,
            },
        },
    }
}

EOF
