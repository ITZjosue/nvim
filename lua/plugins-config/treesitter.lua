local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

-- nvim-treesitter `main` branch: parsers/queries are installed here and this
-- directory is prepended to 'runtimepath'.
ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Parsers to keep installed (`install` is a no-op for parsers already present).
local ensure_installed = {
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "javascript",
  "typescript",
  "tsx",
  "jsdoc",
  "svelte",
  "html",
  "html_tags", -- queries required by html/svelte
  "css",
  "json",
  "yaml",
  "bash",
  "ruby",
  "go",
  "gomod",
  "python",
}

ts.install(ensure_installed)

-- The `main` branch does not enable anything on its own: highlighting has to be
-- started per buffer.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
  desc = "Start treesitter highlighting",
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if not lang then
      return
    end
    if not pcall(vim.treesitter.language.add, lang) then
      return
    end
    pcall(vim.treesitter.start, event.buf, lang)
  end,
})
