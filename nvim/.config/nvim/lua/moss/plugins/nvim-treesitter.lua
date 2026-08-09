return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      local ensureInstalled = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "html",
        "markdown",
        "markdown_inline",
        "bash",
        "asm",
        "python",
        "rust",
        "zig",
      }
      local alreadyInstalled = require("nvim-treesitter.config").get_installed()
      local parsersToInstall = vim
        .iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
      require("nvim-treesitter").install(parsersToInstall)
    end,
    keys = {
      {
        "<leader>lI",
        "<Cmd>Inspect<CR>",
        mode = { "n", "v" },
        desc = "[L]anguage Syntax [I]nspection",
      },
      {
        "<leader>ts",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local active = vim.treesitter.highlighter.active[bufnr]

          if active then
            vim.treesitter.stop(bufnr)
            vim.print("Disabled Syntax Highlighting")
          else
            vim.treesitter.start(bufnr)
            vim.print("Enabled Syntax Highlighting")
          end
        end,
        desc = "[T]oggle [S]yntax (Treesitter)",
      },
    },
  },
}
