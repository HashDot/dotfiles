local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local builtin = require('telescope.builtin')

-- show buffers
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
}

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<C-s>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
