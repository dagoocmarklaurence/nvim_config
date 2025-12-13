return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = [[<C-\>]],
		-- direction = "float",
		direction = "horizontal",
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = true,
		persist_size = true,
		float_opts = {
			border = "curved", -- or "single", "double", etc.
			width = 120, -- set your desired width
			height = 40, -- set your desired height
			winblend = 3,
		},
	},
}
