-- Entrypoint for Nvim configuration

require("options")
require("bootstrap_lazy")
require("lazy").setup({
	spec = {
		-- Scan for plugin config files in the plugins directory
		{ import = "plugins" },
	},
	-- Automatically check for plugin updates
	checker = { enabled = true },
})
require("lsp")
require("maps")
