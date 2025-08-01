-- Plugins that affect how Nvim looks

return {
    -- Colorscheme
    {
        "sainnhe/sonokai",
        config = function(_, _)
            vim.g.sonokai_style = "atlantis"
            vim.cmd("colorscheme sonokai")
        end,
        lazy = false
    },

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', "sainnhe/sonokai" },
        opts = {
            options = {
                theme = 'sonokai',
                icons_enabled = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'selectioncount', 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'fzf', 'fugitive' },
            refresh = {
                -- ~140 FPS :)
                refresh_time = 7,
            }
        }
    },

    -- Syntax highlightning
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = true,
            ensure_installed = { "bash", "c", "dockerfile", "java", "javascript", "make", "python", "rust", "typescript", "markdown", "markdown_inline" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        }
    },

    -- UI Rework
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                -- Use Treesitter for rendering
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        },
    },
}
