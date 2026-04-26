return {
	{
		"nvim-mini/mini.files",
		version = "*",
		windows = {
			width_focus = 100,
			width_nofocus = 25,
		},
		keys = {
			{
				-- Open the directory of the file currently being edited
				-- If the file doesn't exist because you maybe switched to a new git branch
				-- open the current working directory
				"<leader>e",
				function()
					local buf_name = vim.api.nvim_buf_get_name(0)
					local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
					if vim.fn.filereadable(buf_name) == 1 then
						-- Pass the full file path to highlight the file
						require("mini.files").open(buf_name, true)
					elseif vim.fn.isdirectory(dir_name) == 1 then
						-- If the directory exists but the file doesn't, open the directory
						require("mini.files").open(dir_name, true)
					else
						-- If neither exists, fallback to the current working directory
						require("mini.files").open(vim.uv.cwd(), true)
					end
				end,
				desc = "Open mini.files (Directory of Current File or CWD if not exists)",
			},
			{
				"<leader>E",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},
		config = function(_, opts)
			require("mini.files").setup(opts)
		end,
	},
}
