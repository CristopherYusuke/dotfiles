vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  disable the spacebar key's default behaviour in Normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)
-- save file without auto-formating
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into  register
vim.keymap.set("n", "x", '"_x', opts)

--- vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "nzzzv", opts)

-- resize with arrows
vim.keymap.set("n", "<S-C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-C-Right>", ":vertical resize +2<CR>", opts)

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts)

-- window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts)

-- navigate splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)

-- toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)
-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic messsage" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
