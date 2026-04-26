return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- Removemos o 'main' e o 'opts' automático para evitar conflitos de carregamento
	config = function()
		-- Tentamos carregar o módulo antigo ou o novo
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			-- Se o módulo 'configs' não existe, tentamos o carregamento direto
			-- Algumas versões novas usam apenas o setup do próprio plugin
			configs = require("nvim-treesitter")
		end

		configs.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"vim",
				"vimdoc", -- Essencial para não dar erro de ajuda
				"regex",
				"dockerfile",
				"json",
				"gitignore",
				"git_config",
				"gitcommit",
				"git_rebase",
				"gitattributes",
				"graphql",
				"yaml",
				"make",
				"cmake",
				"markdown",
				"markdown_inline",
				"tsx",
				"css",
				"html",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { 
				enable = true, 
				disable = { "ruby" } 
			},
		})
	end,
}

