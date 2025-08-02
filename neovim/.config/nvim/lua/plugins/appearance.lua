-- Plugins that affect how Nvim looks

return {
  -- Colorscheme
  {
    "sainnhe/sonokai",
    commit = "5baf26496047788dc000e9287e5ceb7420b2f42e",
    config = function(_, _)
      vim.g.sonokai_style = "atlantis"
      vim.cmd("colorscheme sonokai")
    end,
    lazy = false,
    priority = 1000,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "sonokai",
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "selectioncount", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "fzf", "fugitive" },
      refresh = {
        -- ~140 FPS :)
        refresh_time = 7,
      },
    },
  },

  -- Syntax highlightning
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "c",
          "dockerfile",
          "gitcommit",
          "gitignore",
          "java",
          "javascript",
          "make",
          "python",
          "rust",
          "sql",
          "toml",
          "typescript",
          "markdown",
          "markdown_inline",
          "yaml",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- Treesitter based contextual lines surrounding current position
  "nvim-treesitter/nvim-treesitter-context",

  -- Playground for debugging Treesitter grammars
  "nvim-treesitter/playground",

  -- UI Rework
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp = {
        -- Use Treesitter for rendering
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
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

  -- API to set and show keymaps and keymap groups
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>K",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "which-key",
      },
    },
  },
}
