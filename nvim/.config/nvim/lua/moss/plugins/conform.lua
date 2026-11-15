return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- sh = { "beautysh" },
      -- vhdl = { "vsg" },
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_format = "fallback",
          timemout_ms = 5000,
        })
      end,
      desc = "[C]ode [F]ormat",
    },
  },
}
