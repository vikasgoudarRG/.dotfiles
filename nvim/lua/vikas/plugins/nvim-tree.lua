return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false, -- show dotfiles
      },
    }
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "toggle file explorer" })
  end,
}


