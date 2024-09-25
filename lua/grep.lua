local builtin = require('telescope.builtin')
-- search files, even hidden ones
vim.keymap.set(
  'n',
  '<leader>ff',
  ':lua require"telescope.builtin".find_files({hidden=true})<CR>',
  {}
)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
