return{
	{ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_auto_start = 1 end },
}
