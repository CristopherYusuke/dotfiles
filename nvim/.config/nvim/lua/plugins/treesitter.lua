return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"vim",
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
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true, disable = { "ruby", "javascript", "typescript", "tsx" } },
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
	end,
}
