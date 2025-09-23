-- for maintaining and installing language servers for NEOVIM
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- for interacting with lspconfig to ensure necessary configs are set up
    },
    config = function()
        -- import mason and mason-lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "→",
                    package_uninstalled = "✗",
                }
            }
        })

        -- NOTE: this caused duplicate LSP attachments to buffers when upgrading to NEOVIM V11 -> I've commented
        -- this out for now since it's not crucial.
        ---- set up interaction with lspconfig
        --mason_lspconfig.setup({
        --    -- list of servers for mason to install
        --    ensure_installed = {
        --        "pyright", -- for Python programming
        --        "ruff",
        --        "fortls", -- for FORTRAN programming
        --        "clangd", -- for C/C++ programming
        --    },
        --    -- auto-install configured servers (previously configured with lspconfig)
        --    automatic_installation = true, -- not the same as ensure_installed
        --})

        -- set up interaction with
    end,
}
