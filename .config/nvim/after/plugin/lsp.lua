local lsp_zero = require('lsp-zero')
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['deno_ls'] = { 'javascript', 'typescript' },
    ['gopls'] = { 'go' },
    ['lua_ls'] = { 'lua' },
    ['jsonls'] = { 'json' },
    ['html'] = { 'html' },
    ['jdtls'] = { 'java' }
  }
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Custom symbol for diagnostics, change as desired
    spacing = 2, -- Adjust space between text and diagnostic symbol
  },
  float = {
    source = "always",  -- Show the source of the diagnostic message
    border = "rounded", -- Rounded border for floating windows
    width = 80,         -- Set a fixed width for the floating window
    scope = "line",
  },
  signs = true,             -- Show signs in the sign column
  underline = true,         -- Underline diagnostics in the code
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,     -- Sort diagnostics by severity
})


local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      -- You need a snippet engine here. For example, if using LuaSnip:
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p'] = cmp.mapping.select_prev_item(),
    ['<C-n'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- If you're using LuaSnip
  }, {
    { name = 'buffer' },
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup({
  capabilities = capabilities
})
require('lspconfig').gopls.setup({

  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
    },
  },
})
require('lspconfig').ts_ls.setup({
  capabilities = capabilities
})
require('lspconfig').eslint.setup({
  capabilities = capabilities
})
require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

require('lspconfig').html.setup {
  capabilities = capabilities,
}

require('lspconfig').jdtls.setup({})

-- Auto import Go dependencies on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { noremap = true, silent = true, desc = "Open diagnostic float" })

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'line',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
