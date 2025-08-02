-- Configuration for Language Servers, formatters and autocompletion

-- Completions
local cmp = require("cmp")
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    fields = { "abbr", "kind" },
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
})

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.rust_analyzer.setup({
  cargo = {
    allFeatures = true,
    buildScripts = false,
  },
  root_dir = util.root_pattern("Cargo.toml"),
  capabilities = cmp_capabilities,
})
