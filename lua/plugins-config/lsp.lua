-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    -- open the definition in a new tab
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition({
        on_list = function(list)
          local items = list.items
          if #items == 0 then return end
          local item = items[1]
          vim.cmd('tabedit ' .. vim.fn.fnameescape(item.filename))
          vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
          vim.cmd('normal! zz')
          if #items > 1 then
            vim.fn.setqflist({}, ' ', { title = list.title, items = items })
            vim.cmd('botright copen')
          end
        end,
      })
    end, opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('harper_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('html')
vim.lsp.enable('svelte')
vim.lsp.enable('gopls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('dockerls')
vim.lsp.enable('grammarly')
vim.lsp.enable('sqls')
vim.lsp.enable('lemminx')
vim.lsp.enable('bashls')
vim.lsp.enable('biome')
vim.lsp.config('solargraph', {
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
      completion = true,
      -- the server comes from mason, not the project's Gemfile
      useBundler = false,
    },
  },
})
vim.lsp.enable('solargraph')
vim.lsp.enable('xmlformat')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pylsp')
-- vim.lsp.enable('mdformat')
-- vim.lsp.enable('textlint')
vim.lsp.enable('markdown-oxide')
