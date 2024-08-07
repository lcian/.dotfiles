
-- local client = vim.lsp.start_client {
--     name = "clingo-lsp",
--     cmd = { "/home/lorenzo/projects/clingo-language-server/clingo-language-server" }
-- }
-- 
-- if not client then
--     vim.notify "Something went wrong when starting clingo-lsp"
--     return
-- end
-- 
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "markdown",
--     callback = function ()
--         vim.lsp.buf_attach_client(0, client)
--     end,
-- })

require("lorenzo")

vim.filetype.add({
    extension = {
        lp = "gringo"
    }
})

local name = "gringo-language-server"
local client = vim.lsp.start_client {
    name = name,
    cmd = { name },
    -- cmd = { "/home/lorenzo/projects/gringo-language-server/target/debug/gringo-language-server" },
    -- cmd_env = { RUST_BACKTRACE = "full" }
}

if not client then
    vim.notify ("Something went wrong when starting " .. name)
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "gringo",
    callback = function ()
        vim.lsp.buf_attach_client(0, client)
    end,
})

vim.keymap.set("n", "<leader>l", ":LspLog<CR>G")
vim.keymap.set("n", "<leader>r", ":LspRestart<CR>")

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config["gringo"] = {
--   install_info = {
--     --url = "https://github.com/potassco/tree-sitter-clingo",
--     url = "/home/lorenzo/projects/tree-sitter-gringo",
--     files = {"src/parser.c"},
--     --branch = "master",
--   },
--   filetype = "gringo",
-- }
