-- Formatting (conform.nvim) and linting (nvim-lint).
-- Tools are auto-installed via mason-tool-installer (see mason.lua).

-- Returns true if any of `names` exists in a parent directory of the current buffer.
local function has_config(names)
	return vim.fs.find(names, { upward = true, path = vim.fn.expand("%:p:h") })[1] ~= nil
end

local eslint_configs = {
	"eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts",
	".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yml", ".eslintrc.yaml",
}
local stylelint_configs = {
	"stylelint.config.js", "stylelint.config.mjs", "stylelint.config.cjs",
	".stylelintrc", ".stylelintrc.js", ".stylelintrc.cjs", ".stylelintrc.json", ".stylelintrc.yml", ".stylelintrc.yaml",
}

-- Linters that only make sense when the project has its own config
-- (they error out otherwise).
local linter_conditions = {
	eslint_d = function() return has_config(eslint_configs) end,
	stylelint = function() return has_config(stylelint_configs) end,
}

return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				rust = { "rustfmt" }, -- from rustup / system package, not mason
				go = { "goimports", "gofumpt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang_format" },
				cpp = { "clang_format" },
				markdown = { "markdownlint" },
			},
			format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				go = { "golangcilint" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				html = { "htmlhint" },
				css = { "stylelint" },
				scss = { "stylelint" },
				c = { "cpplint", "clangtidy" },
				cpp = { "cpplint", "clangtidy" },
				-- rust: clippy runs through rust-analyzer (see lsp.lua)
			}

			local function try_lint()
				local names = lint._resolve_linter_by_ft(vim.bo.filetype)
				names = vim.tbl_filter(function(name)
					local linter = lint.linters[name]
					if not linter then
						return false
					end
					-- skip linters whose binary isn't installed (yet)
					local cmd = type(linter) == "table" and linter.cmd or nil
					if type(cmd) == "function" then
						cmd = cmd()
					end
					if type(cmd) == "string" and vim.fn.executable(cmd) == 0 then
						return false
					end
					local cond = linter_conditions[name]
					return cond == nil or cond()
				end, names)
				if #names > 0 then
					lint.try_lint(names)
				end
			end

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
				callback = try_lint,
			})
			try_lint()

			vim.keymap.set("n", "<leader>l", try_lint, { desc = "Lint current buffer" })
		end,
	},
}
