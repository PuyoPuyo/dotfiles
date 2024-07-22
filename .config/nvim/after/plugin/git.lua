vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>",
	{silent = true, noremap = true}
	)

vim.keymap.set("n", "<leader>gB", ":G blame<CR>",
	{silent = true, noremap = true}
	)

vim.keymap.set('n', '<leader>sS', require('telescope.builtin').git_status,
	{ desc = '' }
	)

vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	{silent = true, noremap = true}
	)

vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	{silent = true, noremap = true}
	)

