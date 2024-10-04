require('nvim-tmux-navigation').setup({
  disable_when_zoomed = true -- defaults to false
})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-\\>', '<Cmd>NvimTmuxNavigateLastActive<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Space>', '<Cmd>NvimTmuxNavigateNext<CR>', opts)
