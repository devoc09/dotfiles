UsePlugin 'nvim-cmp'

set completeopt=menu,menuone,noselect,noinsert
lua << EOF
local cmp = require 'cmp'
cmp.setup({
    preselect = {
        none = true,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
    },
    snippet = {
        expand = function(args)
            require 'snippy'.expand_snippet(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'snippy' },
        { name = 'path' }
    },
})
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
EOF
