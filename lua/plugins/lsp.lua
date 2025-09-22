return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        clangd = {
          mason = false,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "-j=4",
            "--query-driver=/usr/bin/clang-*,/usr/bin/gcc-*,/usr/bin/g++*,/usr/bin/aarch64-*,"
              .. "/usr/lib*/ccache/gcc,/usr/lib*/ccache/g++",
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "clang-format",
        "codelldb",
      })
    end,
  },
}
