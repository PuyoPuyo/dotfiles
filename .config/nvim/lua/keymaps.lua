vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})

-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})

-- buffers
vim.api.nvim_set_keymap("n", "tk", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})

-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sd", ":Zi<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>cf", ":let @+ = expand(\"%\")<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>cp", ":let @+ = expand(\"%:p\")<CR>", {noremap=true})

-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")

-- quickfix
vim.api.nvim_set_keymap("n", "]q", ":cn<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "[q", ":cp<CR>", {noremap=true})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n'}, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n'}, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'n'}, 'n', 'nzzzv')
vim.keymap.set({ 'n'}, 'N', 'Nzzzv')

-- greatest remap ever, from primeagen
vim.keymap.set({'x'}, "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "‹leader›y", "\"+y")
vim.keymap.set("n", "‹leader›Y", "\"+Y")

-- search and replace and enable execution on current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<space>LS", "<cmd>lua vim.diagnostic.show()<CR>", {noremap=false})
vim.keymap.set("n", "<space>LH", "<cmd>lua vim.diagnostic.hide()<CR>", {noremap=false})
