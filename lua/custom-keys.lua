-- fetch keymap
local map = vim.api.nvim_set_keymap

-- map the key ctrl-n to run the command :NvimTreeToggle
map('n', '<C-n>', [[:NvimTreeToggle<cr>]], {})

-- map keys to navigate buffers in view
map('n', '<C-h>', '<C-w>h', {}) -- LEFT
map('n', '<C-j>', '<C-w>j', {}) -- DOWN
map('n', '<C-k>', '<C-w>k', {}) -- UP
map('n', '<C-l>', '<C-w>l', {}) -- RIGHT

-- map keys to cycle through buffers
map('n', '<S-l>', [[:bnext<cr>]], {}) -- NEXT
map('n', '<S-h>', [[:bprevious<cr>]], {}) -- PREVIOUS

-- toggle relative numbers
map('n', '<S-r>', [[:set rnu<cr>]], {}) -- Set relative numbers
map('n', '<S-r>o', [[:set rnu!<cr>]], {}) -- Set relative numbers off
map('n', '<S-n>', [[:set number<cr>]], {}) -- Set numbers
map('n', '<S-n>o', [[:set number!<cr>]], {}) -- Set numbers off

-- map keys to resize panes
map('n', '<C-Up>', '<C-w>-', {})
map('n', '<C-Down>', '<C-w>+', {})
map('n', '<C-Left>', '<C-w><', {})
map('n', '<C-Right>', '<C-w>>', {})

-- map load terminal in new tab
map('n', '<C-t>', [[:tab|term<cr>i]], {})
map('t', '<C-t>o', '<C-\\><C-n>', {}) -- Terminal mode off (Normal mode)

---------------------
-- LEADER MAPPINGS --
---------------------

-- close current pane
map('n', '<leader>c', [[:BufDel<cr>]], { desc = 'Close current buffer' })

-- map split to leader
map('n', '<leader>s', [[:split|:set laststatus=3<cr>]], {}) -- horizontal split
map('n', '<leader>v', [[:vsplit<cr>]], {}) -- veritical split

-- map leader to quit
map('n', '<leader>q', [[:q<cr>]], {})

-- map toggle comment in normal mode
map(
  'n',
  '<leader>/',
   "<esc><cmd>lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<cr>",
   {}
)

-- map toggle comment in visual mode
map(
  'v',
  '<leader>/',
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
   {}
)
