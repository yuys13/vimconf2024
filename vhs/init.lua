vim.opt.list = true

vim.opt.listchars = {
	tab = "¦-",
	trail = "-",
	nbsp = "+",
	extends = "»",
	precedes = "«",
}

vim.opt.number = true

vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/collama.nvim")

local config = {
	base_url = "http://localhost:11434/api/",
	model = "codellama:7b-code",
}

local augroup = vim.api.nvim_create_augroup("my_collama_augroup", { clear = true })

-- auto execute debounced_request
vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI", "TextChangedI" }, {
	group = augroup,
	callback = function()
		require("collama.copilot").debounced_request(config, 1000)
	end,
})
-- auto cancel
vim.api.nvim_create_autocmd({ "InsertLeave", "VimLeavePre" }, {
	group = augroup,
	callback = function()
		require("collama.copilot").clear()
	end,
})
-- map accept key
vim.keymap.set("i", "<C-f>", require("collama.copilot").accept)

require("collama.logger").setup(vim.notify)
