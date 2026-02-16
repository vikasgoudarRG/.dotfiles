return 
{
  'stevearc/oil.nvim',
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      -- columns = { "icon" },
      columns = { },
      view_options = {
        show_hidden = true,
      }
    })
    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<leader>-", function() require("oil").toggle_float() end, { desc = "Open oil float" })
  end,
}

