require("nvim-treesitter.configs").setup({
  ensure_installed = {},   -- don't auto-download anything
  auto_install = false,    -- don't install on buffer open
  sync_install = false,
  parser_install_dir = vim.fn.expand("$PREFIX/lib/tree_sitter"),
  highlight = {
    enable = true,
  },
})

-- Tell nvim to look there
vim.opt.runtimepath:append("$PREFIX/lib")
