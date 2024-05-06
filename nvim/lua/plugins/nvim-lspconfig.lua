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
			buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
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
    -- format on save
    vim.api.nvim_create_autocmd({'BufWritePre'}, {
      pattern = {"*.py"},
      callback = function() vim.lsp.buf.format({ timeout=1500, async=false }) end,
    })

    -- imports & format on save
    vim.api.nvim_create_autocmd({'BufWritePre'}, {
      pattern = {"*.go"},
      callback = function(args)
        vim.lsp.buf.code_action({
          context={only={ 'source.organizeImports' }},
          apply = true
        })
        vim.wait(100)
        vim.lsp.buf.format({ timeout=1500, async=false })
      end,
    })

	end,
}
