return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		-- 1. Setup language parsers safely using the modern top-level API
		local ts = require("nvim-treesitter")
		ts.install({
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
		})

		-- 2. Turn on native auto-installation for missing filetypes
		ts.auto_install = true

		-- 3. Enable Native Neovim Tree-sitter Highlighting via Autocommands
		local ts_group = vim.api.nvim_create_augroup("NativeTreesitter", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = ts_group,
			callback = function(args)
				local ft = vim.bo[args.buf].filetype

				-- SAFEGUARD 1: Check if runtime queries are valid before trying to load
				local has_parser, _ = pcall(vim.treesitter.query.get, ft, "highlights")
				if not has_parser then
					return
				end

				-- SAFEGUARD 2: If a query has an invalid field name, pcall safely drops it
				-- without throwing a blocking error popup.
				local success, _ = pcall(vim.treesitter.start, args.buf)
				if not success then
					return
				end

				-- Enable native tree-sitter indent logic, except for ignored types
				local disabled_indents = { ruby = true, javascript = true, typescript = true, tsx = true }
				if not disabled_indents[ft] then
					vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.foldexpr()"
				end
			end,
		})
	end,
}

