-- Hooks that do things
-- Run this file after plugins, as we might need to use them

-- On yank, highlight yanked region
local yank_highlightning = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = yank_highlightning,
    pattern = "*",
})
