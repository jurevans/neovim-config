local cmp = require'cmp'
local luasnip = require'luasnip'
local snip_status_ok, luasnip = pcall(require, "luasnip")
local lspkind_status_ok, lspking = pcall(require, "lspkind")

if not snip_status_ok then return end

local border_opts = {
  border = "single",
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup({ 
  enabled = function()
    if vim.api.nvim_get_option_value("buftype", { buf = 0}) == "prompt" then return false end
    return vim.g.cmp_enabled
  end,
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    cmp_tabnine = 1,
    buffer = 1,
    path = 1,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  mapping = {
    -- Tab to go to the next suggestion
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        print("CMP VISIBLE->SELECT NEXT ITEM")
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        print("EXPAND OR JUMP")
        luasnip.expand_or_jump()
      elseif has_words_before() then
        print("HAS WORDS BEFORE")
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    -- Shift+TAB to go to the Previous Suggested item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- CTRL+SHIFT+f to scroll backwards in description
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    -- CTRL+F to scroll forwards in the description
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- CTRL+SPACE to bring up completion at current Cursor location
    ['<C-Space>'] = cmp.mapping.complete(),
    -- CTRL+e to exit suggestion and close it
    ['<C-e>'] = cmp.mapping.close(),
    -- CR (enter or return) to CONFIRM the currently selection suggestion
    -- We set the ConfirmBehavior to insert the Selected suggestion
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  },
  window = {
    completion = cmp.config.window.bordered(border_opts),
    documentation = cmp.config.window.bordered(border_opts),
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon ={
        nvim_lsp = 'λ',
        vsnip = '⋗',
        buffer = 'Ω',
        path = '/',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

-- require('lspconfig')['rust'].setup {
--   capabilities = capabilities
-- }
