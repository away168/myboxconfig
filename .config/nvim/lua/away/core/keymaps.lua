vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment / decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Resize equally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sr", "<C-w>r", { desc = "Rotate windows" })
keymap.set("n", "<leader>sh", "<C-w>H", { desc = "Move current window far left" })
keymap.set("n", "<leader>sj", "<C-w>J", { desc = "Move current window far bottom" })
keymap.set("n", "<leader>sk", "<C-w>K", { desc = "Move current window far top" })
keymap.set("n", "<leader>sl", "<C-w>L", { desc = "Move current window far right" })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tj", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tk", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
