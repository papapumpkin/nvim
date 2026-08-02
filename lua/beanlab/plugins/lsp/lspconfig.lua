return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		-- IDE-style navigation keymaps, applied to every buffer an LSP attaches to.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local function nmap(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
				end

				nmap("gd", vim.lsp.buf.definition, "Go to definition")
				nmap("gD", vim.lsp.buf.declaration, "Go to declaration")
				nmap("gi", vim.lsp.buf.implementation, "Go to implementation")
				nmap("gr", vim.lsp.buf.references, "References")
				nmap("K", vim.lsp.buf.hover, "Hover docs")
				nmap("<leader>rs", vim.lsp.buf.rename, "Replace symbol (all instances)")
				nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
				nmap("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
				nmap("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
				nmap("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				nvim_lsp["ts_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["cssls"] = function()
				nvim_lsp["cssls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["tailwindcss"] = function()
				nvim_lsp["tailwindcss"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["html"] = function()
				nvim_lsp["html"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["jsonls"] = function()
				nvim_lsp["jsonls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["eslint"] = function()
				nvim_lsp["eslint"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["pyright"] = function()
				nvim_lsp["pyright"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["gopls"] = function()
				nvim_lsp["gopls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["golangci_lint_ls"] = function()
				nvim_lsp["golangci_lint_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				nvim_lsp["lua_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				})
			end,
		})
	end,
}
