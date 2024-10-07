local remember_folds = vim.api.nvim_create_augroup("remember_folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  group = remember_folds,
  command = "mkview"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  group = remember_folds,
  command = "silent! loadview"
})




