require("lorenzo")

local client = vim.lsp.start_client {
    name = "clingo-lsp",
    cmd = { "/home/lorenzo/projects/clingo-lsp/clingo-lsp" }
}

if not client then
    vim.notify "Something went wrong when starting clingo-lsp"
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function ()
        vim.lsp.buf_attach_client(0, client)
    end,
})
