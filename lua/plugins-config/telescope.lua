local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  pickers = {
    buffers = {
      mappings = {
        i = { ["<C-d>"] = actions.delete_buffer }, -- deletes in isert mode
        n = { ["dd"] = actions.delete_buffer }, -- deletes in normal mode
      },
    },
  },
})
