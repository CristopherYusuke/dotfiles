return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- You can leave this empty for default settings
			})
		end,
	},
}
