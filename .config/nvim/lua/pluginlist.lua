return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup()
			vim.cmd.colorscheme("catppuccin-mocha")
		end
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"black",
				"debugpy",
				"ruff",
				"pyright"
			},
		},
	},
	'tpope/vim-obsession',
	'junegunn/fzf',
	'junegunn/fzf',
	'nanotee/zoxide.vim',

	'numToStr/Comment.nvim', -- "gc" to comment
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'github/copilot.vim',

    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	{
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },

	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	'theHamsta/nvim-dap-virtual-text',
	{
		'mfussenegger/nvim-dap-python',
		ft = 'python',

	},

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope-ui-select.nvim',
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
		cond = vim.fn.executable 'make' == 1 
    },

	{	'nvim-telescope/telescope-symbols.nvim'},
	{
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
        dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
	  "nvim-telescope/telescope-frecency.nvim",
	  config = function()
		require("telescope").load_extension "frecency"
	  end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
		  require("notify").setup({
			background_colour = "#000000",
			enabled = false,
		  })
		end
	},
	"nvim-lualine/lualine.nvim",
	{
		"folke/noice.nvim",
		config = function()
		  require("noice").setup({
			-- add any options here
			routes = {
			  {
				filter = {
				  event = 'msg_show',
				  any = {
					{ find = '%d+L, %d+B' },
					{ find = '; after #%d+' },
					{ find = '; before #%d+' },
					{ find = '%d fewer lines' },
					{ find = '%d more lines' },
				  },
				},
				opts = { skip = true },
			  }
			},
		  })
		end,
		dependencies = {
		  -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		  "MunifTanjim/nui.nvim",
		  "rcarriga/nvim-notify",
		}
	},
	{
		"folke/twilight.nvim",
		opts = {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	},
	{
	  "christoomey/vim-tmux-navigator",
	  cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	  },
	  keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	  },
	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

    {
      "folke/trouble.nvim",
      opts = {
        max_items = 500,
      }, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle win.type=split win.position=right<cr>",
          desc = "Quickfix List (Trouble)",
        },
        {
          "<leader>xH",
          "<cmd>Trouble qflist toggle win.type=split win.position=bottom<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },

	{
		"wojciech-kulik/xcodebuild.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("xcodebuild").setup({
			})
		end,
	},
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- set this if you want to always pull the latest change
      opts = {
        mappings = {
            sidebar = {
              switch_windows = "<leader>ws",
              reverse_switch_windows = "<S-Tab>",
            },
        },

        file_selector = {
            provider = "telescope"
        },

        provider = "claude", -- Recommend using Claude
        auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot

        vendors = {
            ---@type AvanteProvider
            claude_son = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-5-sonnet-20241022",
                temperature = 0,
                max_tokens = 4096,
            },

            ---@type AvanteProvider
            ollama = {
              endpoint = '127.0.0.1:11434/v1',
              model = 'llama3.2',
              parse_response_data = function(data_stream, event_state, opts)
                require('avante.providers').copilot.parse_response(data_stream, event_state, opts)
              end,
              parse_curl_args = function(opts, code_opts)
                return {
                  url = opts.endpoint .. '/chat/completions',
                  headers = {
                    ['Accept'] = 'application/json',
                    ['Content-Type'] = 'application/json',
                  },
                  body = {
                    model = opts.model,
                    messages = require('avante.providers').copilot.parse_messages(code_opts), 
                    max_tokens = 4096,
                    stream = true,
                  },
                }
              end,
            },

            qwen = {
                __inherited_from = "openai",
                api_key_name = "",
                endpoint = "http://127.0.0.1:11434/v1",
                model = "qwen2.5-coder",
                max_tokens = 4096,
            }        
        },

        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
        },
    
        -- add any opts here
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
	--[[
	{
		'xbase-lab/xbase',
		dependencies = {
			'neovim/nvim-lspconfig',
		},
		build = "make install",
		config = function()
			require 'xbase'.setup {
				log_level = vim.log.levels.DEBUG,
				simctl = {
					iOS = {
						"iPhone 15 Pro"
					}
				},
				mappings = {
					build_picker = 0,
					run_picker = 0,
					watch_picker = 0,
					all_picker = 0,
					toggle_split_log_buffer = 0,
					toggle_vsplit_log_buffer = 0
				}
			}
		end
	},

	--]]
}
