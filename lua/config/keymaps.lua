local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Exit n mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- Cut character without yanking
keymap.set("n", "x", '"_x')

-- Increment/decrement
-- keymap.set("n", "+", ":inc<cr>", opts)
-- keymap.set("n", "-", ":dec<cr>", opts)

-- Move selected lines - inspired from the ThePrimeagen
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
-- keymap.set("n", "<C-m>", "<C-i>", opts)

-- Tab Management
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
--
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Split window
keymap.set("n", "s-", ":split<Return>", opts)
keymap.set("n", "s|", ":vsplit<Return>", opts)
keymap.set("n", "sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
-- keymap.set("n", "<leader>h", "<C-w><")
-- keymap.set("n", "<leader>l", "<C-w>>")
-- keymap.set("n", "<leader>j", "<C-w>+")
-- keymap.set("n", "<leader>h", "<C-w>-")

-- keymap.set("n", "<C-w><left>", "<C-w><")
-- keymap.set("n", "<C-w><right>", "<C-w>>")
-- keymap.set("n", "<C-w><up>", "<C-w>+")
-- keymap.set("n", "<C-w><down>", "<C-w>-")

-- PLUGINS

-- Undo Tree
keymap.set("n", "<leader>uut", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
--  IncRename
keymap.set("n", "<leader>rn", ":IncRename ")
