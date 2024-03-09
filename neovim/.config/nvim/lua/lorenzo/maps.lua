vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
    f = {
        name = "Telescope",
        f = { "<cmd>Telescope find_files<CR>", "Find File" },
        g = { "<cmd>Telescope git_files<CR>", "Git files" },
        r = { "<cmd>Telescope live_grep<CR>", "Live grep" },
        m = { "<cmd>Telescope marks initial_mode=normal<CR>", "Marks" }
    },
}, { prefix = "<leader>" })

wk.register({
    b = { "<cmd>Telescope buffers initial_mode=normal<CR>", "Buffers" }
}, { prefix = "<leader>" })

wk.register({
    g = {
        name = "LSP",
        d = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
        f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
        u = { ":lua vim.lsp.buf.references()<cr>", "Usage" },
        R = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
        h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
        A = { ":lua vim.lsp.buf.code_action()<CR>", "Code action" },
        t = { ":Trouble<CR>", "Trouble" },
        c = {
            name = "Copilot",
            e = { ":Copilot enable<CR>:Copilot status<CR>", "Enable" },
            d = { ":Copilot disable<CR>:Copilot status<CR>", "Disable" },
            s = { ":Copilot panel<CR>", "Status" }
        }
    }
}, { prefix = "<leader>" })


wk.register({
    u = { ":UndotreeToggle<CR>", "UndoTree" },
}, { prefix = "<leader>" })

wk.register({
    m = { ":NvimTreeFindFileToggle<CR>", "NvimTree" },
}, { prefix = "<leader>" })

wk.register({
    ["<leader>,"]  = { ":AerialToggle!<CR>", "Aerial" }
})

wk.register({
    ["p"] = { ":BufferPrevious<CR>", "Previous buffer" },
    ["n"] = { ":BufferNext<CR>", "Next buffer"         },
    ["q"] = { ":BufferClose<CR>", "which_key_ignore"    },
    ["1"] = { ":BufferGoto 1<CR>", "which_key_ignore"   },
    ["2"] = { ":BufferGoto 2<CR>", "which_key_ignore"   },
    ["3"] = { ":BufferGoto 3<CR>", "which_key_ignore"   },
    ["4"] = { ":BufferGoto 4<CR>", "which_key_ignore"   },
    ["5"] = { ":BufferGoto 5<CR>", "which_key_ignore"   },
    ["6"] = { ":BufferGoto 6<CR>", "which_key_ignore"   },
    ["7"] = { ":BufferGoto 7<CR>", "which_key_ignore"   },
    ["8"] = { ":BufferGoto 8<CR>", "which_key_ignore"   },
    ["9"] = { ":BufferGoto 9<CR>", "which_key_ignore"   },
}, { prefix = "<leader>" })

wk.register({
    Q = "which_key_ignore"
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
vim.cmd [[ let g:tmux_navigator_no_mappings = 1 ]]
vim.cmd [[ noremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr> ]]
vim.cmd [[ noremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr> ]]
vim.cmd [[ noremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr> ]]
vim.cmd [[ noremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr> ]]

-- nvim-tree
-- vim.keymap.set("n", "<leader>m", ":NvimTreeFindFileToggle<CR>")

-- aerial (code outline)
-- vim.keymap.set("n", "<leader>,", ":AerialToggle!<CR>")

-- buffer navigation
-- vim.keymap.set("n", "<leader>p", ":BufferPrevious<CR>")
-- vim.keymap.set("n", "<leader>n", ":BufferNext<CR>")
-- vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")
-- vim.keymap.set("n", "<leader>1", ":BufferGoto 1<CR>")
-- vim.keymap.set("n", "<leader>2", ":BufferGoto 2<CR>")
-- vim.keymap.set("n", "<leader>3", ":BufferGoto 3<CR>")
-- vim.keymap.set("n", "<leader>4", ":BufferGoto 4<CR>")
-- vim.keymap.set("n", "<leader>5", ":BufferGoto 5<CR>")
-- vim.keymap.set("n", "<leader>6", ":BufferGoto 6<CR>")
-- vim.keymap.set("n", "<leader>7", ":BufferGoto 7<CR>")
-- vim.keymap.set("n", "<leader>8", ":BufferGoto 8<CR>")
-- vim.keymap.set("n", "<leader>9", ":BufferGoto 9<CR>")


-- toggler
-- vim.keymap.set({'n', 'v'  }, '<leader>i', ":lua require('nvim-toggler').toggle()")

-- flash
vim.keymap.set({"n", 'v'}, 's', function() require("flash").jump() end)

-- harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end)
