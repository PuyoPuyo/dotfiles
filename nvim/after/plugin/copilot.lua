require('copilot').setup({
  suggestion = {
    enabled = not vim.g.ai_cmp,
    auto_trigger = true,
    hide_during_completion = vim.g.ai_cmp,
    keymap = {
      accept = "<C-y>",     -- Control+Y to accept
      next = "<Right>",     -- Right arrow to next
      prev = "<Left>",      -- Left arrow to previous
      dismiss = "<C-e>",    -- Control+E to dismiss
    },
  },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
  debug = true,
})
