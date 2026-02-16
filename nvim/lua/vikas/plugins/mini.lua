return {
    {"echasnovski/mini.nvim", version = false },

    -- 1. Mini Files
    {
        'echasnovski/mini.files',
        config = function()
            local MiniFiles = require("mini.files")
            MiniFiles.setup({
                mappings = {
                    go_in = "<CR>",
                    go_in_plus = "L",
                    go_out = "-",
                    go_out_plus = "H",
                },
            })
            vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
            vim.keymap.set("n", "<leader>ef", function()
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                MiniFiles.reveal_cwd()
            end, { desc = "Toggle into currently opened file" })
        end,
    },

    -- 2. Mini Surround
    {
      "echasnovski/mini.surround",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        mappings = {
          add = 'sa',
          delete = 'sd',
          find = 'sf',
          find_left = 'sF',
          highlight = 'sh',
          replace = 'sr',
          suffix_last = 'l',
          suffix_next = 'n',
        },
        n_lines = 20,
        search_method = 'cover',
        silent = false,
      },
    }, 

    -- 3. Mini Trailspace
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
          local trail = require("mini.trailspace")

          trail.setup({
            only_in_normal_buffers = true,
          })

          vim.keymap.set("n", "<leader>cw", trail.trim, { desc = "Trim whitespace" })

          -- This group ensures the autocmd is cleaned up correctly
          local group = vim.api.nvim_create_augroup("TrailspaceClear", { clear = true })

          vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorMovedI" },
            {
              group = group,
              callback = function()
                trail.unhighlight()
              end,
            }
          )
        end,
    },
    -- Split & join
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")
            miniSplitJoin.setup({
                mappings = {toggle = ""}, -- Disable default mapping
            })
            vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
            vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
        end,
    },
}
