require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),           -- lsp
	require("plugins.autocompletion"),
	require("plugins.none-ls"),       --formatter
	require("plugins.gitsigns"),      -- git
	require("plugins.alpha"),         -- ASCII design upon opening of neovim
	require("plugins.indent-blankline"), --indenting
	require("plugins.misc"),          -- other plugins
	require("plugins.toggleterm"),    -- open up a terminal
	require("plugins.debug"),         -- debugging
	require("plugins.flash"),         -- Easily go the the specific line
	require("plugins.smear-cursor"),
})
