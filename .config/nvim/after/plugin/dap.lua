require('dapui').setup()
require('dap-python').setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
require('nvim-dap-virtual-text').setup()
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>[t", ":DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>[b", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>[o", ":DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>[i", ":DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>[c", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>[r", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
