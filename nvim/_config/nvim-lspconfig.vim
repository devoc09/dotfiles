UsePlugin 'nvim-lspconfig'

set hidden

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format(nil, nil, true, nil, nil, nil) end
    })
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '@', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'di', '<cmd>lua vim.diagnostic.open_float()<CR>',opts)
  -- buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},
}
nvim_lsp['terraformls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"rust-analyzer"},
    settings = {
        assist = {
            impoortGranularity = "module",
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
-- nvim_lsp['denols'].setup {
    --on_attach = on_attach,
    --capabilities = capabilities,
    --root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
--}
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
}
nvim_lsp['pylsp'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {'pyls'},
}
nvim_lsp['solargraph'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
nvim_lsp['zls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
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

EOF

" autocmd BufWritePre *.go\|rs lua vim.lsp.buf.format(nil, nil, true, nil, nil, nil)
autocmd BufWritePre *.go lua OrgImports(1000)
