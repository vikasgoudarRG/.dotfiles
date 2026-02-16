return 
{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'andrew-george/telescope-themes',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')
      local telescope = require('telescope')

      telescope.load_extension("fzf")
      telescope.load_extension("themes")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
        },
        extensions = {
          themes = {
            enable_previewer = true,
            enable_live_preview = true,
            persist = {
              enabled = true,
              path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
            },
          },
        },
      })

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fr', "<cmd>Telescope oldFiles<CR>", { desc = 'Telescope recent files' })
      vim.keymap.set('n', '<leader>fc', function() builtin.find_files 
        { cwd = vim.fn.stdpath("config")} end, { desc = 'Open neovim root config folder' }) 
      vim.keymap.set("v", "<leader>fv", function()
        vim.cmd('noau normal! "vy')
        local text = vim.fn.getreg('v')
        require('telescope.builtin').grep_string({ search = text })
      end, { desc = "Find selection in project" })

      vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
    end,
}
