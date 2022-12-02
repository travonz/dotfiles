
let g:nvimgdb_use_find_executables = 0
let g:nvimgdb_use_cmake_to_find_executables = 0
let g:nvimgdb_disable_start_keymaps = 1

lua << EOF

vim.api.nvim_set_keymap('n', '<Space>d', ':!source $PLK_PREFIX_DIR/etc/env<CR>:GdbStart gdb -ex "set breakpoint pending on" -f -q --args bin/CaDe --config ~/.CaDe-DEV<CR><CR>', { noremap = true })

EOF
