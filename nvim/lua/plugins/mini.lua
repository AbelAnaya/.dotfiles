return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects. Adds next concept with n
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Add indentation scope guideline of current indentation level where cursor is positioned
		require("mini.indentscope").setup({
			draw = {
				animation = function()
					return 0
				end,
			},
			symbol = "│",
		})
		-- Improve f and t commands by allowing to jump also between lines
		require("mini.jump").setup()
	end,
}
