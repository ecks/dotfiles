require('vimp')

vim.g.mapleader=","

-- Save file
vimp.nnoremap('<Leader>w', ':w<CR>')
-- Reload
vimp.nnoremap('<Leader>r', ':so $MYVIMRC<CR>')

-- turn off search highlighting
vimp.nnoremap('<Leader><space>', ':nohlsearch<CR>')

--vimp.nnoremap('<C-J>', '<C-W><C-J>')
--vimp.nnoremap('<C-K>', '<C-W><C-K>')
--vimp.nnoremap('<C-L>', '<C-W><C-L>')
--vimp.nnoremap('<C-H>', '<C-W><C-H>')
--vimp.nnoremap('<C-->', '<C-W><C-S>')
--vimp.nnoremap('<C-|>', '<C-W><C-V>') 

-- copy/paste
vimp.vnoremap('<Leader>c', '"+y')

vimp.nnoremap('<Leader>v', '"+p')
vimp.inoremap('<Leader>v', '<C-r>+')

-- run the current line as if it were a command
vimp.nnoremap('<leader>e', ":exe getline(line('.'))<cr>")

-- move vertically by visual line
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')

-- highlight last inserted text
vimp.nnoremap('gV', '`[v`]')

-- toggle netrw in the current buffer
vimp.nnoremap('<Leader>nn', ':Ex<CR>')
vimp.nnoremap('<Leader>nv', ':Vex<CR>')

-- Telescope
--require("telescope").setup {
--  defaults = {
--    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--  },
--}


vimp.nnoremap('<Leader>ff', ':Telescope find_files<CR>')
vimp.nnoremap('<Leader>fg', ':Telescope git_files<CR>')
vimp.nnoremap('<Leader>b', ':Telescope buffers<CR>')
vimp.nnoremap('<Leader>g', ':Telescope live_grep<CR>')

--local actions = require "telescope.actions"

function edit_neovim()
  local opts_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },

--    attach_mappings = function(_, map)
 --     map("i", "<c-y>", set_prompt_to_entry_value)
--      map("i", "<M-c>", function(prompt_bufnr)
--        actions.close(prompt_bufnr)
--        vim.schedule(function()
--          require("telescope.builtin").find_files(opts_without_preview)
--        end)
--      end)
--
--      return true
--    end,
  }

--  opts_without_preview = vim.deepcopy(opts_with_preview)
--  opts_without_preview.previewer = false

  require("telescope.builtin").find_files(opts_with_preview)
end

vimp.nnoremap('<Leader>d', ':lua edit_neovim()<CR>')


local u = require('utils')

u.create_augroup({
    { 'InsertEnter', '*', 'set', 'number', 'norelativenumber'},
    {'InsertLeave', '*', 'set', 'number', 'relativenumber'},
}, 'every')

vim.cmd('hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white')
vim.cmd('hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white')
vimp.nnoremap('<Leader>H', ':set cursorline! cursorcolumn!<CR>')


-- plugins

-- toggle gundo
vimp.nnoremap('<Leader>ud', ':GundoToggle<CR>')

-- look up docs for unimpaired
vimp.nnoremap('<Leader>uh', ':help unimpaired<CR>')
