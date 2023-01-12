local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local builtin = require('telescope.builtin')

-- show buffers
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)

vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<C-s>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
