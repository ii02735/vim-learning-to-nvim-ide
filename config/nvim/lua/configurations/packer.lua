-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'https://gitlab.com/__tpb/monokai-pro.nvim',
		as = 'monokai-pro.nvim'
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

end)
