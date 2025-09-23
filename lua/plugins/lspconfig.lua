-- lspconfig has now been demoted to just providing config files
-- since a new LSP API has been introduced since NVIM V0.11
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
