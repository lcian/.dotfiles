-- helpers
local function add(value, str, sep)
    sep = sep or ','
    str = str or ''
    value = type(value) == 'table' and table.concat(value, sep) or value
    return str ~= '' and table.concat({ value, str }, sep) or value
end

-- general
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
vim.opt.backspace = add { 'indent', 'eol', 'start' }
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.modeline = false

-- correct rendering of colors
vim.cmd [[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]]
vim.cmd [[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]]
vim.opt.termguicolors = true

-- colorscheme
vim.cmd [[ let g:sonokai_style="atlantis" ]]
vim.cmd [[ colorscheme sonokai ]]

-- looks
vim.opt.mouse = 'nvi'
vim.cmd [[ set guicursor=n-v-c-i:block ]]
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.ruler = true
vim.opt.linebreak = true
vim.opt.showbreak = [[↪ ]]
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.scrolloff = 9
vim.opt.laststatus = 3

-- search
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess:append("W")

-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- buffers
vim.opt.hidden = true
vim.opt.bufhidden = 'hide'

-- experimental
-- open Telescope on startup if the first argument is a directory
local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
            -- Vim creates a buffer for folder. Close it.
            vim.cmd(":bd 1")
            require("telescope.builtin").find_files({ search_dirs = { first_arg } })
        end
    end,
    group = ts_group,
})

vim.cmd [[ highlight CursorColumn guibg=#736431 ]]
vim.cmd [[ highlight CursorLine guibg=#736431 ]]

local lspconfig = require("lspconfig")
local util = require "lspconfig.util"
lspconfig.gopls.setup {
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
        }
    }
}

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- python
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,
        --
        -- go
        null_ls.builtins.formatting.gofmt.with({
            extra_args = { "s" },
        }),
        null_ls.builtins.formatting.goimports_reviser,
        -- null_ls.builtins.formatting.golines,
        --        
        -- c
        null_ls.builtins.formatting.clang_format,
        --
        -- rust
        null_ls.builtins.formatting.rustfmt,
        --
        -- general
        -- null_ls.builtins.diagnostics.cspell
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
