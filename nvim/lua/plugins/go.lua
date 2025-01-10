return {
  {
    'devoc09/go-test.nvim',
    keys = {
      { '<leader>,', function() require('go-test').go_test_package() end },
      { '<leader>t', function() require('go-test').go_test_all() end },
    },
    ft = "go",
    enabled = true,
  },
}
