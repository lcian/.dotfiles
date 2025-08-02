-- Hooks that do things on events
-- Run this file after plugins, as hooks might rely on them

-- On yank, highlight yanked region
local yank_highlight = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_highlight,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- On save, format files using Conform
local lsp_format = vim.api.nvim_create_augroup("LspFormat", { clear = false })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_format,
  pattern = "*",
  callback = function(args)
    -- Don't create an entry in the undofile, as it would mess up the cursor position
    vim.cmd.undojoin()
    require("conform").format({ bufnr = args.buf })
  end,
})
