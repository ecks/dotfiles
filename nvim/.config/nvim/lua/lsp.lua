local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

local custom_attach = function()
--  require'completion'.on_attach()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
  mapper('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

  mapper('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>')
  mapper('n', 'gr', '<cmd>Telescope lsp_references<cr>')

  mapper('n', '<leader>cr', '<cmd>lua MyLspRename()<cr>')
  mapper('n', '<leader>gs', '<cmd>Telescope lsp_document_symbols<cr>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  mapper('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

end

local lspconfig = require'lspconfig'
lspconfig.bashls.setup{on_attach=custom_attach}
lspconfig.gopls.setup{settings = {
                        gopls = {
                          analyses = {
                            unusedparams = true,
                          },
                          staticcheck = true,
                        },
                      },
                      on_attach=custom_attach,
                      cmd = { "gopls" },
                      filetypes = { "go", "gomod" },
                      root_dir = lspconfig.util.root_pattern("go.mod", ".git")}
lspconfig.pylsp.setup{on_attach=custom_attach}
lspconfig.sumneko_lua.setup {
  on_attach=custom_attach,
  cmd = {"/home/hristo.asenov/lua-language-server/bin/lua-language-server", "-E", "/home/hristo.asenov/lua-language-server/main.lua"};
}
lspconfig.rust_analyzer.setup{on_attach=custom_attach}
lspconfig.vuels.setup{on_attach=custom_attach}
lspconfig.yamlls.setup{
  on_attach=custom_attach,
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*/*.yaml"
      }
    }
  }
}

function MyLspRename()
  local current_word = vim.fn.expand("<cword>")
  local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.2)
  vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
  vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
    vim.api.nvim_win_close(plenary_window.win_id, true)

    if text ~= '' then
      vim.schedule(function()
        vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })

        vim.lsp.buf.rename(text)
      end)
    else
      print("Nothing to rename!")
    end
  end)

  vim.cmd [[startinsert]]
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
--vim.api.nvim_set_keymap('i', '<Tab>', [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], {noremap = true, expr = true})
--vim.api.nvim_set_keymap('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], {noremap = true, expr = true})

