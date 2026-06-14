return {
	"olimorris/codecompanion.nvim",
	version = "*", -- Latest stable release
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("codecompanion").setup({
			-- UPDATED: "strategies" is now "interactions"
			interactions = {
				chat = { adapter = "ollama_local" },
				inline = { adapter = "ollama_local" },
				cmd = { adapter = "ollama_local" },
			},
			-- UPDATED: Custom adapters must nest under the "http" table
			adapters = {
				http = {
					ollama_local = function()
						return require("codecompanion.adapters").extend("ollama", {
							env = {
								url = "http://192.168.0.25:11434",
							},
							schema = {
								model = {
									default = "qwen3.5:9b",
								},
								num_ctx = {
									default = 16384,
								},
							},
						})
					end,
				},
			},
		})

		-- Keymaps
		vim.keymap.set({ "n", "v" }, "<LocalLeader>at", "<cmd>CodeCompanionChat Toggle<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<LocalLeader>aa", ":CodeCompanionActions<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<LocalLeader>ai", "<cmd>CodeCompanion<cr>", { silent = true })
	end,
}
