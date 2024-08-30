return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = "$TOOLCHAIN_PATH/usr/bin/sourcekit-lsp",
        },
      },
    },
  },
}
