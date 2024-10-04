require('wrapping').setup({
  auto_set_mode_heuristically = true,
  create_commands = true,
  create_keymaps = false,
})

require('wrapping').set_mode_heuristically()

vim.keymap.set("n", "yow", vim.cmd.ToggleWrapMode)
