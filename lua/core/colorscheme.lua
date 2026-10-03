require('tokyonight').setup({
  transparent = true,
  styles = {
    sidebars = "transparent", -- nvim-tree, qf, help, etc.
    floats = "transparent",
  },
})
vim.cmd("colorscheme tokyonight")

-- require('catppuccin').setup({
--   flavour = "mocha",
--   transparent_background = true,
--   float = {
--     transparent= true,
--   }
-- })
-- vim.cmd("colorscheme catppuccin-nvim")

-- vim.cmd("colorscheme oxocarbon")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- vim.cmd("colorscheme nord")
-- vim.g.nord_disable_background = true
-- require('nord').set()

-- vim.cmd("colorscheme poimandres")
-- vim.cmd("colorscheme github_dark_high_contrast")
-- vim.cmd("colorscheme github_dark_dimmed")

-- require("gruvbox").setup({
--   transparent_mode = true,
-- })
-- vim.cmd("colorscheme gruvbox")

-- vim.cmd("colorscheme cyberdream")
-- vim.cmd[[colorscheme matrix]]
-- vim.g.matrix_disable_background = true
-- require('matrix').set({})
