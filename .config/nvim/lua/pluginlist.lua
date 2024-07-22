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

	'numToStr/Comment.nvim', -- "gc" to comment
	"tpope/vim-fugitive",
	'lewis6991/gitsigns.nvim',

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
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
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
