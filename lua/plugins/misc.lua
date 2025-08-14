-- Standalone plugins with less than 10 lines of config go here
return {
	-- {
	--   -- Tmux & split window navigation
	--   'christoomey/vim-tmux-navigator',
	-- },
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		-- Lorem
		"derektata/lorem.nvim",
		config = function()
			require("lorem").opts({
				sentence_length = "mixed", -- using a default configuration
				comma_chance = 0.3, -- 30% chance to insert a comma
				max_commas = 2, -- maximum 2 commas per sentence
				debounce_ms = 200, -- default debounce time in milliseconds
			})
		end,
	},
	-- {
	--     -- Add, delete, replace, find, highlight surrounding (like pair of parenthesis, quotes, etc.).
	--     "echasnovski/mini.misc",
	--     config = function()
	--         local misc = require("mini.misc")
	--         misc.setup({})
	--
	--         misc.setup_termbg_sync()
	--     end,
	-- },
}
