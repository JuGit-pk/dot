return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    -- INSPIRED from the ThePrimeagen
    keymap.set("n", "<leader>ha", function()
      mark.add_file()
    end, { desc = "Add File - Harpoon" })
    keymap.set("n", "<leader>hh", function()
      ui.toggle_quick_menu()
    end, { desc = "Open Menu - Harpoon" })

    keymap.set("n", "<leader>h1", function()
      ui.nav_file(1)
    end, { desc = "Jump to File 1 - Harpoon" })
    keymap.set("n", "<leader>h2", function()
      ui.nav_file(2)
    end, { desc = "Jump to File 2 - Harpoon" })
    keymap.set("n", "<leader>h3", function()
      ui.nav_file(3)
    end, { desc = "Jump to File 3 - Harpoon" })
    keymap.set("n", "<leader>h4", function()
      ui.nav_file(4)
    end, { desc = "Jump to File 4 - Harpoon" })

    keymap.set("n", "<leader>hn", function()
      ui.nav_next()
    end, { desc = "Go to next harpoon mark" })
    keymap.set("n", "<leader>hp", function()
      ui.nav_prev()
    end, { desc = "Go to previous harpoon mark" })
  end,
}
