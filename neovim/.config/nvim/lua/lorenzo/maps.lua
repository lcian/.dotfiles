vim.g.mapleader = " "

local wk = require("which-key")

wk.add({
	{ "<leader>f", group = "Telescope" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Git files" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
	{ "<leader>fl", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
	{ "<leader>fm", "<cmd>Telescope marks initial_mode=normal<CR>", desc = "Marks" },
	{ "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
	{ "<leader>fj", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
})

wk.add({
	{ "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
})

wk.add({
	{ "<leader>g", group = "LSP" },
	{ "<leader>gA", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
	{ "<leader>gR", ":lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
	{ "<leader>gc", group = "Copilot" },
	{ "<leader>gcd", ":Copilot disable<CR>:Copilot status<CR>", desc = "Disable" },
	{ "<leader>gce", ":Copilot enable<CR>:Copilot status<CR>", desc = "Enable" },
	{ "<leader>gcs", ":Copilot panel<CR>", desc = "Status" },
	{ "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
	{ "<leader>gf", ":lua vim.lsp.buf.format()<CR>", desc = "Format" },
	{ "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
	{ "<leader>gt", ":Trouble diagnostics<CR>", desc = "Trouble" },
	{ "<leader>gu", ":lua vim.lsp.buf.references()<cr>", desc = "Usage" },
})

wk.add({
	{ "<C-S>", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
})

wk.add({
	{ "<leader>u", ":UndotreeToggle<CR>", desc = "UndoTree" },
})

-- wk.register({
--     m = { ":NvimTreeFindFileToggle<CR>", "NvimTree" },
-- }, { prefix = "<leader>" })

wk.add({
	{ "<leader>,", ":AerialToggle!<CR>", desc = "Aerial" },
})

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
	{ "Q", hidden = true },
})

-- telescope
-- vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
-- vim.keymap.set('n', '<leader>fg', ":Telescope git_files<CR>")
-- vim.keymap.set('n', '<leader>fr', ":Telescope live_grep<CR>")
-- vim.keymap.set('n', '<leader>b', ":Telescope buffers initial_mode=normal<CR>")

-- git
-- vim.keymap.set("n", "<leader>gg", ":Git<CR>")

-- LSP
-- vim.keymap.set('n', '<leader>gd', ":lua vim.lsp.buf.definition()<CR>")
-- vim.keymap.set("n", "<leader>gf", ":lua vim.lsp.buf.format()<CR>")
-- vim.keymap.set('n', '<leader>gu', ":lua vim.lsp.buf.references()<cr>")
-- vim.keymap.set('n', '<leader>gR', ":lua vim.lsp.buf.rename()<cr>")
-- vim.keymap.set('n', '<leader>gh', ":lua vim.lsp.buf.hover()<CR>")

-- vim.keymap.set('n', '<leader>gS', ":lua vim.lsp.buf.document_symbol()<CR>")
-- vim.keymap.set('n', '<leader>gn', ":lua vim.lsp.diagnostic.goto_next()<CR>")
-- vim.keymap.set('n', '<leader>gp', ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- vim.keymap.set('n', '<leader>gi', ":lua vim.lsp.buf.implementation()<CR>")
-- vim.keymap.set('n', '<leader>gs', ":lua vim.lsp.buf.signature_help()<CR>")
-- vim.keymap.set('n', '<leader>gD', ":lua vim.lsp.buf.type_definition()<CR>")
-- vim.keymap.set('n', '<leader>gW', ":lua vim.lsp.buf.workspace_symbol()<CR>")
-- vim.keymap.set('n', '<leader>gF', ":lua vim.lsp.buf.formatting()<CR>")
-- vim.keymap.set('n', '<leader>gE', ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
-- vim.keymap.set('n', '<leader>gC', ":lua vim.lsp.diagnostic.set_loclist()<CR>")
-- vim.keymap.set('n', '<leader>gQ', ":lua vim.lsp.diagnostic.set_qflist()<CR>")

-- Copilot
-- vim.keymap.set('n', '<leader>gcd', ":Copilot disable<CR>:Copilot status<CR>")
-- vim.keymap.set('n', '<leader>gce', ":Copilot enable<CR>:Copilot status<CR>")
-- vim.keymap.set('n', '<leader>gcs', ":Copilot panel<CR>")

-- disable dangerous command
vim.keymap.set("n", "Q", "<nop>")

-- undotree
-- vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- vim-tmux-navigator
vim.cmd([[ let g:tmux_navigator_no_mappings = 1 ]])
vim.cmd([[ noremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr> ]])
vim.cmd([[ noremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr> ]])
vim.cmd([[ noremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr> ]])
vim.cmd([[ noremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr> ]])

-- nvim-tree
-- vim.keymap.set("n", "<leader>m", ":NvimTreeFindFileToggle<CR>")

-- aerial (code outline)
-- vim.keymap.set("n", "<leader>,", ":AerialToggle!<CR>")

-- buffer navigation
-- vim.keymap.set("n", "<leader>p", ":BufferPrevious<CR>")
-- vim.keymap.set("n", "<leader>n", ":BufferNext<CR>")
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")
vim.keymap.set("n", "<leader>1", ":BufferGoto 1<CR>")
vim.keymap.set("n", "<leader>2", ":BufferGoto 2<CR>")
vim.keymap.set("n", "<leader>3", ":BufferGoto 3<CR>")
vim.keymap.set("n", "<leader>4", ":BufferGoto 4<CR>")
vim.keymap.set("n", "<leader>5", ":BufferGoto 5<CR>")
vim.keymap.set("n", "<leader>6", ":BufferGoto 6<CR>")
vim.keymap.set("n", "<leader>7", ":BufferGoto 7<CR>")
vim.keymap.set("n", "<leader>8", ":BufferGoto 8<CR>")
vim.keymap.set("n", "<leader>9", ":BufferGoto 9<CR>")

-- toggler
-- vim.keymap.set({'n', 'v'  }, '<leader>i', ":lua require('nvim-toggler').toggle()")

-- flash
vim.keymap.set({ "n", "v" }, "s", function()
	require("flash").jump()
end)

-- harpoon
-- local harpoon = require("harpoon")
-- harpoon:setup()
--
-- vim.keymap.set("n", "<leader>a",
--     function()
--         harpoon:list():append()
--         print("Added current file to Harpoon list")
--     end
-- )
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

vim.keymap.set("n", "<C-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-N>", function()
	harpoon:list():next()
end)

vim.keymap.set("n", "<leader>h", ":Hardtime disable<CR>")
vim.keymap.set("n", "<leader>H", ":Hardtime enable<CR>")

local function toggle_cursor_highlight()
	local cursorline = vim.wo.cursorline
	local cursorcolumn = vim.wo.cursorcolumn
	vim.wo.cursorline = not cursorline
	vim.wo.cursorcolumn = not cursorcolumn
end
vim.keymap.set("n", "<leader>th", toggle_cursor_highlight)

vim.keymap.set("n", "<leader>lt", ":InspectTree<CR>")
vim.keymap.set("n", "<leader>lq", ":EditQuery<CR>")

vim.keymap.set("n", "<leader>tp", require("precognition").toggle)

vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
