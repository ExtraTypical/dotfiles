vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Allows for moving text around with J and K --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in the center of screen when jumping across half the page --
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in the center of the screen --
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows for pasting without ruining current buffered copy --
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allows for yanking to actual computer register instead of just to local buffer --
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- Apparently used for quickfix, not really sure what these do right now --
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Allows for the immediate editing of the word that you're on, globally throughout the file --
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Allows for the immediate making of something into an executable --
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "<C-n>", "<C-w><C-w>")
