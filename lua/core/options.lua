local opt = vim.opt

-- line numbers
-- opt.relativenumber = true
opt.number = true

-- tabs and identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- baskpsce
opt.backspace = "indent,eol,start"

-- reload files changed on disk outside of nvim
opt.autoread = true

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- code folding
vim.o.foldmethod = "indent"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99

