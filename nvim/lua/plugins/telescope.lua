return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
        },
      })

      pcall(telescope.load_extension, 'fzf')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })

      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>/fg', builtin.current_buffer_fuzzy_find, { desc = 'Live grep current buffer' })
 
    end,
  },
}
