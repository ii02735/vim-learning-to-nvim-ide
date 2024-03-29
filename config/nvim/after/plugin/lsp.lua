-- LSP configuration file

local lsp = require('lsp-zero')
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local servers = {
	'tsserver',
	'eslint',
	'intelephense',
--	'psalm',
	'html',
	'jsonls',
	'marksman',
	'pyright',
	-- 'gopls' : requires go interpreter to be installed
}

lsp.preset('recommended')

lsp.ensure_installed(servers)

lsp.set_preferences({
	sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
	-- on_attach = my_custom_on_attach,
	capabilities = capabilities,
	}
end
