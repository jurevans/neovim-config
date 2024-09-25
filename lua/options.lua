-- define vim options
local options = {
  opt = {
    -- tab settings
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
    -- completeopt is used to manage code suggestions
      -- menuone: show popup even when there is only one suggestion
      -- noinsert: Only insert text when selection is confirmed
      -- noselect: force us to select one from the suggestions
    completeopt = {'menuone', 'noselect', 'noinsert', 'preview'},
    -- shortmess is used to avoid excessive messages
    shortmess = vim.opt.shortmess + { c = true},

  },
  g = {
    -- update leader key to ,
    mapleader = ",",
    -- disable netrw at the very start of your init.lua (strongly advised)
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    -- for buffer
    termguicolors = true

  }
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
