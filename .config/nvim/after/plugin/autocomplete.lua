--[[ require("autoclose").setup() ]]

function AutoCompleter()
  local col = vim.fn.col('.')
  local line = vim.fn.getline('.')

  local previousChar = line:sub(col - 2, col - 2)

  if previousCar == '.' then
    return vim.api.nvim_replace_termcodes("<c-x><c-o>", true, true, true)
  else
    return vim.api.nvim_replace_termcodes("<tab>", true, true, true)
  end
end


vim.api.nvim_set_keymap('i', '<tab>', 'v:lua.AutoCompleter()', { expr = true, noremap = true })
