return {
	"NMAC427/guess-indent.nvim",
	event = "BufReadPost",
	config = function() -- This is the function that runs, AFTER loading
		require("guess-indent").setup()
	end,
}
