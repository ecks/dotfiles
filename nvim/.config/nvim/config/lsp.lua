vim.cmd('packadd nvim-lspconfig')

local mapper = function(mode, key, result)
  vim.fn.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

local custom_attach = function()
  require'completion'.on_attach()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
  mapper('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
end

require'lspconfig'.pyls.setup{on_attach=custom_attach}
require'lspconfig'.gopls.setup{on_attach=custom_attach}
require'lspconfig'.bashls.setup{}
require'lspconfig'.rust_analyzer.setup{}

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.fn.nvim_set_keymap('i', '<Tab>', [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], {noremap = true, expr = true})
vim.fn.nvim_set_keymap('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], {noremap = true, expr = true})

-- Set completeopt to have a better completion experience
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
-- Avoid showing message extra message when using completion
vim.api.nvim_command('set shortmess+=c')
