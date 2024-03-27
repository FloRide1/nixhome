local servers = { 'tsserver', 'rust_analyzer', "clangd", "jdtls", "pyright", "omnisharp", "texlab", 'volar' }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
end

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

require("mason-lspconfig").setup {
    -- ensure_installed = servers,
}
