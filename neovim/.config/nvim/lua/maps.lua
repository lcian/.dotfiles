-- Configures most keymaps
-- Some of these require plugins to be present, so run this after loading plugins

local wk = require("which-key")

-- vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<M-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<M-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<M-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<M-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })

wk.add({
  { "<leader>1", ":BufferGoto 1<CR>", hidden = true },
  { "<leader>2", ":BufferGoto 2<CR>", hidden = true },
  { "<leader>3", ":BufferGoto 3<CR>", hidden = true },
  { "<leader>4", ":BufferGoto 4<CR>", hidden = true },
  { "<leader>5", ":BufferGoto 5<CR>", hidden = true },
  { "<leader>6", ":BufferGoto 6<CR>", hidden = true },
  { "<leader>7", ":BufferGoto 7<CR>", hidden = true },
  { "<leader>8", ":BufferGoto 8<CR>", hidden = true },
  { "<leader>9", ":BufferGoto 9<CR>", hidden = true },
  { "<leader>n", ":BufferNext<CR>", desc = "Next buffer" },
  { "<leader>p", ":BufferPrevious<CR>", desc = "Previous buffer" },
  { "<leader>q", ":BufferClose<CR>", hidden = true },
})

wk.add({
  { "<leader>u", ":UndotreeToggle<CR>", desc = "UndoTree" },
})

wk.add({
  {
    "s",
    mode = { "n", "x", "o" },
    function()
      require("flash").jump()
    end,
    desc = "Flash",
  },
})

wk.add({
  { "gd", ":lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
  { "<C-S>", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
})
wk.add({
  { "<leader>g", group = "LSP" },
  { "<leader>gR", ":lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>gf", ":lua vim.lsp.buf.format()<CR>", desc = "Format" },
  { "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
  { "<leader>gt", ":Trouble diagnostics toggle<CR>", desc = "Trouble" },
  { "<leader>gu", ":lua vim.lsp.buf.references()<cr>", desc = "Usage" },
})

wk.add({
  { "<leader>f", group = "Telescope" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Git files" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
  { "<leader>fr", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  { "<leader>fm", "<cmd>Telescope marks initial_mode=normal<CR>", desc = "Marks" },
  { "<leader>fj", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
  { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
})

wk.add({
  { "<leader>l", ":Lazy<CR>", desc = "Lazy" },
})

local function toggle_cursor_highlightning()
  local cursorline = vim.wo.cursorline
  local cursorcolumn = vim.wo.cursorcolumn
  vim.wo.cursorline = not cursorline
  vim.wo.cursorcolumn = not cursorcolumn
end

wk.add({
  { "<leader>t", group = "Theme" },
  { "<leader>th", toggle_cursor_highlightning, desc = "Toggle cursor highlightning" },
})

wk.add({
  { "Q", hidden = true },
})
