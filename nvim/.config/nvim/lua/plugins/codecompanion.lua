return({
	{
		"olimorris/codecompanion.nvim",
		version = "*", -- Latest stable release
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: for autocomplete integration
			"nvim-telescope/telescope.nvim", -- Optional: for search/buffer context
		},
		config = function()
			local ollamaConfig = {
				name = "ollama_local",
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
			}

			local opt = {
				strategies = {
					chat = {
						adapter = "ollama_local",
					},
					inline = {
						adapter = "ollama_local",
					},
					agent = {
						adapter = "ollama_local",
					},
				},
				adapters = {
					ollama_local = function()
						return require("codecompanion.adapters").extend("ollama", ollamaConfig)
					end,
				},
			}

			require("codecompanion").setup(opt)

			-- Toggle the persistent AI Chat Split
			vim.keymap.set({ "n", "v" }, "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { silent = true })

			-- Open the quick Action Palette UI
			vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { silent = true })

			-- Inline assistant rewrite prompt
			vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { silent = true })
		end,
	},
})
