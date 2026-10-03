local status, markview = pcall(require, "markview")
if not status then
  return
end

markview.setup({
  preview = {
    icon_provider = "devicons", -- uses nvim-web-devicons
    -- render in normal, operator-pending and command mode
    modes = { "n", "no", "c" },
    -- in these modes, show the raw text of the lines under the cursor
    hybrid_modes = { "n" },
    linewise_hybrid_mode = true,
  },
})

vim.keymap.set("n", "<leader>mp", "<cmd>Markview toggle<CR>", { desc = "Toggle markview preview" })
vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Toggle markview split preview" })
