return {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	-- vim.cmd[[colorscheme tokyonight-moon]]
	-- 	-- vim.cmd([[colorscheme tokyonight]])
	-- 	-- vim.cmd([[colorscheme tokyonight-day]])
	-- 	vim.cmd([[colorscheme tokyonight-storm]])
	-- end,

	-- "sainnhe/everforest",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	-- Optionally configure and load the colorscheme
	-- 	-- directly inside the plugin declaration.
	-- 	vim.g.everforest_enable_italic = true
	-- 	vim.cmd.colorscheme("everforest")
	-- end,

	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.cmd("colorscheme kanagawa-wave")
		-- vim.cmd("colorscheme kanagawa-dragon")
		-- vim.cmd("colorscheme kanagawa-lotus")
	end,

	-- "nickkadutskyi/jb.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	-- require("jb").setup({transparent = true})
	-- 	vim.cmd("colorscheme jb")
	-- end,

	-- "realbucksavage/riderdark.vim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	-- require("jb").setup({transparent = true})
	-- 	-- vim.cmd("colorscheme jb")
	-- 	vim.cmd("colorscheme riderdark")
	-- end,
}
