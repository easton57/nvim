-- Mason + automatic installation of formatters and linters.
-- Debug adapters are installed by mason-nvim-dap (see dap.lua),
-- LSP servers by mason-lspconfig (see lsp.lua).
return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				-- Formatters
				"stylua", -- lua
				"ruff", -- python (format + lint + import sorting)
				"goimports", -- go
				"gofumpt", -- go
				"prettierd", -- javascript / typescript / html / css
				"clang-format", -- c / c++
				"markdownlint", -- markdown

				-- Linters
				"golangci-lint", -- go
				"eslint_d", -- javascript / typescript
				"htmlhint", -- html
				"stylelint", -- css
				"cpplint", -- c / c++
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
