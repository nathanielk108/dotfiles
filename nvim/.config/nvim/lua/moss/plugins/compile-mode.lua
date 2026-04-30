return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { "m00qek/baleia.nvim", tag = "v1.3.0" }, -- allow ANSI Escape Code coloring
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {

        default_command = "make",

        -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
        -- set this to fix tab completion in command mode:
        -- input_word_completion = true,

        -- baleia_setup = true, -- enable ANSI Escape Code coloring

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
    }
  end,
  keys = {
    {
      "<leader>cc",
      "<Cmd>Compile<CR>",
      desc = "[C]ode [C]ompile",
    },
    {
      "<leader>cr",
      "<Cmd>Recompile<CR>",
      desc = "[C]ode [R]ecompile",
    },
    {
      "<leader>cq",
      "<Cmd>QuickfixErrors<CR>",
      desc = "[C]ode Errors to [Q]uickfix",
    },
  },
}
