vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap

--keymap.set("i","++","<ESC>")
keymap.set("n","<leader>nh",":nohl<CR>")
keymap.set("n","x",'"_x"')
keymap.set("n", "<leader>w",function()
vim.wo.wrap = not vim.wo.wrap
end) -- toggle wrap

keymap.set("n","<leader>sv","<C-w>v") -- slit vertically
keymap.set("n","<leader>sh","<C-w>s") -- split horizontally
keymap.set("n","<leader>se","<C-w>=") -- make split windows equila width
keymap.set("n","<leader>sx",":close<CR>") -- close current split window

keymap.set("n","<leader>to",":tabnew<CR>") -- open new tab
keymap.set("n","<leader>tx",":tabclose<CR>") -- close current tab
keymap.set("n","<leader>tn",":tabn<CR>") -- go to next tan
keymap.set("n","<leader>tp",":tabp<CR>") -- go to previous tab
-- moving trhoug open files
keymap.set("n","<C-H>","<C-W>h") -- go to the file to the left side
keymap.set("n","<C-L>","<C-W>l")
keymap.set("n","<C-J>","<C-W>j")
keymap.set("n","<C-K>","<C-W>k")

-- plugins
-- vim-maximizer
keymap.set("n","<leader>sm",":MaximizerToggle<CR>")
-- Telescope
keymap.set("n","<leader>ff",":Telescope find_files<CR>")
keymap.set("n","<leader>fg",":Telescope live_grep<CR>")
keymap.set("n","<leader>fb",":Telescope buffers<CR>")
keymap.set("n","<leader>fh",":Telescope help_tags<CR>")

keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- move between buffers
keymap.set('n', '<S-Tab>', ':bprevious<CR>',{ noremap = true })

-- Visual map for maintain Visual Mode after shifting > and <
keymap.set('v', '<', '<gv', {})
keymap.set('v', '>', '>gv', {})

keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move up the line you are standing at
keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move down the line you are standing at
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move up in visual mode when selecting multiple lines
keymap.set("v",  "<A-k>", ":m '<-2<CR>gv=gv") -- move down in visual mode when selecting multiple lines
-- code folding
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- keymap.set('n', 'zR', require('ufo').openAllFolds)
-- keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- mostrar descripcio de errores
keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Abrir diagnóstico flotante' })
