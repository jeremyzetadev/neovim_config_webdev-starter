return {
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.1",
		opts = {
			ensure_installed = {
                "html",
				"javascript",
				"typescript",
				"css",
				"gitignore",
				"graphql",
				"http",
				"json",
				"scss",
				"sql",
				"vim",
				"lua",
        "c",
        "cpp"
			},

            indent = {
                enable = false,
                disable = {},
            },

            autotag = {
                enable = true,
                filetypes = {'html' ,'xml', 'php', 'vue', 'tsx', 'typescript', 'typescriptreact' },
            },

			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
            highlight = {
                enable = true
            },
		},
}
