return {
	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false, -- Load immediately since it's a theme
		config = function()
			require("catppuccin").setup()
			vim.cmd.colorscheme("catppuccin-mocha")
		end
	},

	-- LSP and Completion
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp',
		},
	},

	-- Debugging
	{ 
		"rcarriga/nvim-dap-ui", 
		event = "VeryLazy",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} 
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		event = "VeryLazy",
	},
	{
		'mfussenegger/nvim-dap-python',
		ft = 'python',
	},
    {
      'mrcjkb/rustaceanvim',
      version = '^6', -- Recommended
      lazy = false, -- This plugin is already lazy
    },

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		event = { "BufReadPost", "BufNewFile" },
		build = ':TSUpdate',
	},

	-- Telescope and Search
	{
		'nvim-telescope/telescope.nvim',
		cmd = "Telescope",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		event = "VeryLazy",
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = vim.fn.executable 'make' == 1,
		event = "VeryLazy",
	},
	{	
		'nvim-telescope/telescope-symbols.nvim',
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension "frecency"
		end,
	},

	-- Git
	{
		'tpope/vim-fugitive',
		cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
	},
	{
		'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
	},

	-- Navigation and UI
	{
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
		opts = {}
	},
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
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

	-- Editing
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require('mini.comment').setup()
		end
	},

	-- AI and Productivity
	{
		'github/copilot.vim',
		event = "InsertEnter",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
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
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},

	-- Utilities
	{
		'tpope/vim-obsession',
		event = "VeryLazy",
	},
	{
		'junegunn/fzf',
		event = "VeryLazy",
	},
	{
		'nanotee/zoxide.vim',
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = true,
			})
		end
	},
	{
		"folke/trouble.nvim",
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
		opts = {
			max_items = 500,
		},
	},

	-- Development Tools
	{
		"wojciech-kulik/xcodebuild.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("xcodebuild").setup({})
		end,
	},
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      opts = {
        sidebar = {
          switch_windows = "<leader>ws",
          reverse_switch_windows = "<S-Tab>",
        },
        file_selector = {
            provider = "telescope"
        },
        provider = "claude",
        auto_suggestions_provider = "copilot",

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
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "echasnovski/mini.icons", 
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

	-- UI and Status
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- Status line
			require('mini.statusline').setup()
			-- Indent guides
			require('mini.indentscope').setup()
			-- Trailspace
			require('mini.trailspace').setup()
			-- Animate
			require('mini.animate').setup()
		end
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require('mini.pairs').setup()
		end
	},

	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require('mini.surround').setup()
		end
	},

	{
		"echasnovski/mini.files",
		event = "VeryLazy",
		config = function()
			require('mini.files').setup()
		end
	},

	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function()
			require('mini.bracketed').setup()
		end
	},

	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function()
			require('mini.ai').setup()
		end
	},
}
