-- Configures all keymaps
-- Some of these require plugins to be present, so we run this after loading plugins

-- vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set('n', '<M-h>', '<Cmd>TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', '<Cmd>TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', '<Cmd>TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', '<Cmd>TmuxNavigateRight<CR>', { silent = true })
