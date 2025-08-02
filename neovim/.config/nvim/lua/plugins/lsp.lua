-- Plugins to install and configure LSPs, formatters and other tools

return {
  -- Install LSPs and tools
  { "williamboman/mason.nvim", opts = {} },

  -- Source of truth for installed LSPs and tools, use this rather than the Mason UI
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "isort",
        "typescript-language-server",
        "prettierd",
        "gopls",
        "golines",
        "goimports-reviser",
        "lua-language-server",
        "stylua",
        "shellcheck",
      },
    },
  },

  -- Launch LSPs automatically with sensible defaults
  "neovim/nvim-lspconfig",

  -- Bridge mason and lspconfig
  { "williamboman/mason-lspconfig.nvim", opts = {} },

  -- Completions
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",

  -- Snippets support
  "L3MON4D3/LuaSnip",

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "golines", "goimports-reviser", lsp_format = "fallback" },
        python = { "isort", "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        lua = { "stylua" },
      },
    },
  },

  -- Run tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- Required
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      -- Optional
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
    },
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
        },
      })
    end,
  },

  -- Special config for Nvim config files
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
