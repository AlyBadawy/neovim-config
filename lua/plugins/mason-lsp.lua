return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    auto_install = true,
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        "cmake",
        "cssls",
        "tailwindcss",
        "dockerls",
        "elmls",
        "ember",
        "emmet_ls",
        "html",
        "stimulus_ls",
        "eslint",
        "ts_ls",
        "rubocop",
        "ruby_lsp",
        "sqlls",
        "tsp_server",
        "yamlls",
        "eslint_d",
        "black",
        "isort"
      },
    })
  end,
}
