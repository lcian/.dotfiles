vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    use "sainnhe/sonokai"
    use "nvim-tree/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    require('lualine').setup {
        options = {
            theme = 'sonokai',
            icons_enabled = true
        },
        extensions = { 'fzf', 'fugitive' },
        sections = {
            lualine_c = { 'filename', "aerial" }
        }
        --        sections = {
        --            lualine_x = { "aerial" },
        --        }
    }

    use {
        "romgrk/barbar.nvim",
        requires = "nvim-web-devicons"
    }
    require'barbar'.setup({
        icons = {
            buffer_index = true
        }
    })

    -- use "ggandor/leap.nvim"
    -- require('leap').add_default_mappings()

    use({
        "folke/flash.nvim",
        config = function()
            require("flash").setup()
        end
    })

    -- use({
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup({
    --             lsp = {
    --                 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true,
    --                 },
    --             },
    --             -- you can enable a preset for easier configuration
    --             presets = {
    --                 bottom_search = true,         -- use a classic bottom cmdline for search
    --                 command_palette = true,       -- position the cmdline and popupmenu together
    --                 long_message_to_split = true, -- long messages will be sent to a split
    --                 inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    --                 lsp_doc_border = false,       -- add a border to hover docs and signature help
    --             },
    --         })
    --     end,
    --     requires = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- })
    use { "folke/trouble.nvim",
        lsp_trouble = false,
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }
    use { "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    use 'nvim-lua/plenary.nvim'
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "nvim-treesitter/nvim-treesitter-context"
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vimdoc", "python", "javascript", "gitcommit", "gitignore", "dockerfile",
            "json", "yaml", "toml", "sql", "typescript", "rust" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    local telescope = require("telescope")
    telescope.setup {
        defaults = {
            mappings = {
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
            },
        },
    }
    use "tpope/vim-fugitive"

    use "github/copilot.vim"
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }
    local lsp = require('lsp-zero').preset('recommended')
    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
    end)
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    lsp.preset("recommended")
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })
    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil
    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })
    -- lsp.on_attach(function(client, bufnr)
    -- local opts = {buffer = bufnr, remap = false}
    --   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    --   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- end)

    lsp.setup()

    use 'ethanholz/nvim-lastplace'
    require 'nvim-lastplace'.setup {}

    use("mbbill/undotree")

    -- use 'ThePrimeagen/harpoon'
    -- local mark = require("harpoon.mark")
    -- local ui = require("harpoon.ui")

    -- vim.keymap.set("n", "<leader>a", mark.add_file)
    -- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    -- experimental
    use 'christoomey/vim-tmux-navigator'
    use 'nvim-tree/nvim-tree.lua'
    require("nvim-tree").setup()
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    require('aerial').setup()

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
end)
