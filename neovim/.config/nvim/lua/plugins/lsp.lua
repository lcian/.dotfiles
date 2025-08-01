-- Plugins to install

return {
    { "williamboman/mason.nvim",           opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            -- { "j-hui/fidget.nvim", opts = {} }, { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
        },
    },
    { "nvimtools/none-ls.nvim", opts = {} },
}
