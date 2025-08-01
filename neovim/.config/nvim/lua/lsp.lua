-- Configuration for Language Servers and formatters

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
				extraArgs = { "-W", "clippy::pedantic" },
			},
		},
	},
	root_dir = util.root_pattern("Cargo.toml"),
})


lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			format = {
				defaultConfig = {
					indent_style = "space",
					indent_size = 2,
				},
			},
		},
	},
})

-- Format on save using LSP
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = "*", -- every buffer
	callback = function()
		-- Try to format using attached LSP clients if any
		local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
		for _, client in pairs(clients) do
			if client.supports_method("textDocument/formatting") then
				-- Format buffer using LSP and stop after first successful client
				vim.lsp.buf.format({ bufnr = 0, timeout_ms = 1000 })
				break
			end
		end
	end,
})
