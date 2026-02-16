return {
  {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
          -- import nvim-treesitter plugin
          local treesitter = require("nvim-treesitter")

          -- configure treesitter
          treesitter.setup({ -- enable syntax highlighting
              highlight = {
                  enable = true,
                  additional_vim_regex_highlighting = false,
              },
              -- enable indentation
              indent = { enable = true },

              -- ensure these languages parsers are installed


              ensure_installed = {
                  -- Backend languages
                  "go", "gomod", "gowork", "gosum",
                  "java",
                  "cpp", "c",
                  "rust",
                  "python",
                  "proto",

                  -- Infra / DevOps
                  "dockerfile",
                  "yaml",
                  "toml",
                  "make",
                  "terraform",

                  -- Databases / data
                  "sql",
                  "json", "json5",
                  "graphql",

                  -- Shell / scripting
                  "bash",
                  "git_config",

                  -- Neovim / editor
                  "lua", "vim", "vimdoc", "query",

                  -- Docs
                  "markdown", "markdown_inline",
                  "regex",
              },

              incremental_selection = {
                  enable = true,
                  keymaps = {
                      init_selection = "<C-space>",
                      node_incremental = "<C-space>",
                      -- scope_incremental = false,
                      node_decremental = "<C-backspace>",
                  },
              },
          })
          -- force start treesitter for all filetypes
          vim.api.nvim_create_autocmd('FileType', {
              pattern = '*',
              callback = function()
                  pcall(vim.treesitter.start)
              end,
          })
      end,
  },
}
