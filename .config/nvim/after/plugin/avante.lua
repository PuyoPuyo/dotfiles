require('lualine').setup{
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    mappings = {
        sidebar = {
          switch_windows = "<leader>ws",
          reverse_switch_windows = "<S-Tab>",
        },
    },

    provider = "claude", -- Recommend using Claude
    auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
        },
        behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    file_selector = {
        provider = "telescope"
    }

    -- add any opts here
  },
}

