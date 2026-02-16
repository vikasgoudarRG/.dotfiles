return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false, -- Keeps it manual, as you prefer
    })

    local keymap = vim.keymap
    
    keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" }) 
    
    keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session" })
    
    keymap.set("n", "<leader>wa", "<cmd>AutoSession search<CR>", { desc = "Search sessions" })

    vim.keymap.set("n", "<leader>wd", "<cmd>Autosession delete<CR>", { desc = "Delete session for cwd" })
  end,
}
