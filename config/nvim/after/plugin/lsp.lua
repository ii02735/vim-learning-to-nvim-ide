-- LSP configuration file

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'intelephense',
	'psalm',
	'html',
	'jsonls',
	'marksman',
	'pyright',
	'sqlls',
})

-- completion settings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({

	-- Go to previous item on completion list
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	-- Go to next item on completion list
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	-- Select element on completion list
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	-- Start the completion
	['<C-space>'] = cmp.mapping.complete()
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.setup()
