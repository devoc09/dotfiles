return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.opt.hidden = true
		local nvim_lsp = require("lspconfig")

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			-- Mappings.
			local opts = {noremap = true, silent = true}
			buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
			buf_set_keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
			buf_set_keymap("n", "di", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			-- buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
		
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function() vim.lsp.buf.format(nil, nil, true, nil, nil, nil) end
				})
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		
		nvim_lsp["clangd"].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		}
		nvim_lsp["terraformls"].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		nvim_lsp["rust_analyzer"].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "rust-analyzer" },
			settings = {
				assist = {
					importGranularity = "module",
					importPrefix = "self",
				},
				cargo = {
					loadOutDirsFromCheck = true
				},
				procMacro = {
					enable = true
				},
			}
		}
		nvim_lsp['pyright'].setup {
		    on_attach = on_attach,
		    capabilities = capabilities,
		    cmd = {'pyright-langserver', '--stdio'},
		    settings = {
		      python = {
			venvPath = ".",
			pythonPath = "./.venv/bin/python",
			analysis = {
			  extraPaths = {"."},
			  autoSearchPaths = true,
			  diagnosticMode = "openFilesOnly",
			  typeCheckingMode = "off",
			  useLibraryCodeForTypes = false,
			}
		      }
		    }
		}
		nvim_lsp['gopls'].setup {
		    on_attach = on_attach,
		    capabilities = capabilities,
		    cmd = {"gopls", "serve"},
		    settings = {
			gopls = {
			    analyses = {
				unusedparams = true,
			    },
			    staticcheck = true,
			},
		    },
		}
		function OrgImports(wait_ms)
			local params = vim.lsp.util.make_range_params()
			params.context = {only = {"source.organizeImports"}}
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
			for _, res in pairs(result or {}) do
			    for _, r in pairs(res.result or {}) do
			      if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			      else
				vim.lsp.buf.execute_command(r.command)
			      end
			    end
			  end
		end
		vim.api.nvim_create_autocmd({"BufWritePre"}, { pattern = {"*.go"}, command = "lua OrgImports(1000)"})
	end,
}
