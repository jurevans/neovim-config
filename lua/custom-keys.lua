-- fetch keymap
local map = vim.api.nvim_set_keymap

-- update leader key to ,
vim.g.mapleader = ","

-- map the key ctrl-n to run the command :NvimTreeToggle
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

-- map keys to navigate buffers in view
map('n', '<C-h>', '<C-w>h', {}) -- LEFT
map('n', '<C-j>', '<C-w>j', {}) -- DOWN
map('n', '<C-k>', '<C-w>k', {}) -- UP
map('n', '<C-l>', '<C-w>l', {}) -- RIGHT

-- map keys to cycle through buffers
map('n', '<S-l>', [[:bnext<CR>]], {}) -- NEXT
map('n', '<S-h>', [[:bprevious<CR>]], {}) -- PREVIOUS

-- toggle relative numbers
map('n', '<S-r>', [[:set rnu<CR>]], {}) -- Set relative numbers
map('n', '<S-r>o', [[:set rnu!<CR>]], {}) -- Set relative numbers off
map('n', '<S-n>', [[:set number<CR>]], {}) -- Set numbers
map('n', '<S-n>o', [[:set number!<CR>]], {}) -- Set numbers off 

-- map keys to resize panes
map('n', '<C-Up>', '<C-w>-', {})
map('n', '<C-Down>', '<C-w>+', {})
map('n', '<C-Left>', '<C-w><', {})
map('n', '<C-Right>', '<C-w>>', {})

-- map load terminal in new tab
map('n', '<C-t>', [[:tab|term<CR>i]], {})
map('t', '<C-t>o', '<C-\\><C-n>', {}) -- Terminal mode off (Normal mode)

---------------------
-- LEADER MAPPINGS --
---------------------

-- close current pane
map('n', '<leader>c', [[:BufDel<CR>]], { desc = 'Close current buffer' })

-- map split to leader
map('n', '<leader>s', [[:split|:set laststatus=3<CR>]], {}) -- horizontal split
map('n', '<leader>v', [[:vsplit<CR>]], {}) -- veritical split

-- map leader to quit
map('n', '<leader>q', [[:q<CR>]], {})
