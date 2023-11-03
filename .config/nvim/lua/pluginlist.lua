return {
	{ 'numToStr/Comment.nvim', opts = {} },

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
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

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
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
            
        },
    },

	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
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
    },

	{	'nvim-telescope/telescope-symbols.nvim'},
	{	'ThePrimeagen/harpoon'},
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

}
