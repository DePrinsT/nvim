return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"}, -- load whenever a buffer is read or a new one is made
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- completion source for LSP recommendations in cmp
    },
    opts = {
        diagnostics = {
            virtual_text = false,
        }
    },
    config = function()
    end,
}
