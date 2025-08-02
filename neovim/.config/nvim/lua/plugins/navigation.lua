return {
  -- Navigate between Nvim and tmux splits
  "christoomey/vim-tmux-navigator",

  -- Always open files at last edit position
  { "ethanholz/nvim-lastplace", opts = {} },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Navigate undofile as tree
  "mbbill/undotree",

  -- Navigate LSP diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      cmd = "Trouble",
      lsp_trouble = false,
    },
  },

  -- Movement based on labels
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
