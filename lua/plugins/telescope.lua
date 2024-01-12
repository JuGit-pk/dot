return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      pickers = {
        -- find_files = {
        --   hidden = true,
        --   -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        --   find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        -- },
      },
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ["<Esc>"] = actions.close, -- close with <Esc>
            ["q"] = actions.close, -- close with q
            ["Q"] = actions.close, -- close with Q
          },
        },
      },
      extensions = {
        file_browser = {
          initial_mode = "normal",
          path = "%:p:h",
          -- cwd = telescope_buffer_dir(),
          -- show hidden files
          hidden = true,
          -- show hidden files even added in the ignore file i.e. .gitignore
          no_ignore = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = fb_actions.toggle_browser,
              [";"] = fb_actions.goto_cwd,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-f>"] = actions.preview_scrolling_down,
            },
          },
        },
      },
    })

    telescope.load_extension("media_files")
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
    telescope.load_extension("file_browser")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader><leader>", "<cmd>Telescope file_browser<cr>", { desc = "File Editor Telescope" })

    -- keymap.set("n", "<leader>fp", ":Telescope projects", { desc = "Open recent projects" })
    keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Undo Tree" })
  end,
}
