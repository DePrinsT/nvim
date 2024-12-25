return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"}, -- load whenever a buffer is read or a new one is made
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- completion source for LSP recommendations in cmp
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")
        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        
        -- keymaps defined only when a language server attaches to a buffer
        -- Note: should be used below on all LSP configurations
        local on_attach = function(client, bufnr)
            -- LSP shortcuts
            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",
            { desc = "Show LSP references", noremap = true, silent = true }) -- show definition, references
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            { desc = "Go to declaration", noremap = true, silent = true }) -- go to declaration
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
            { desc = "Show LSP definitions", noremap = true, silent = true }) -- show lsp definitions
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
            { desc = "Show LSP implementations", noremap = true, silent = true }) -- show lsp implementations
            vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
            { desc = "Show LSP type definitions", noremap = true, silent = true }) -- show lsp type definitions
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action,
            { desc = "Show available code actions", noremap = true, silent = true }) -- show available code actions 
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
            { desc = "Smart rename", noremap = true, silent = true }) -- smart rename
            vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
            { desc = "Show buffer diagnostics", noremap = true, silent = true }) -- Show buffer diagnostics
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
            { desc = "Show line diagnostics", noremap = true, silent = true }) -- Show line diagnostics
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
            { desc = "Go to previous diagnostic", noremap = true, silent = true }) -- Jump to previous diagnostic in buffer
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
            { desc = "Go to next diagnostic", noremap = true, silent = true }) -- Jump to previous diagnostic in buffer
            vim.keymap.set("n", "K", vim.lsp.buf.hover,
            { desc = "Show documentation for what is under cursor", noremap = true, silent = true }) -- show docs for what is under cursor
            vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>",
            { desc = "Restart LSP", noremap = true, silent = true }) -- restart LSP
        end
        
        -- use for cmp to override default NEOVIM capabilities when making a request to an LSP
        -- needed to enable LSP-related autocompletion features
        local cmp_capabilities = cmp_nvim_lsp.default_capabilities()
        
        -- change the diagnostic signals
        local signs = { Error = "⮾ ", Warn = "⚠ ", Hint = "ⓘ ", Info = "🛈 "}
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = ""})
        end

        -- !!! MAKE AND ACTIVAT BASIC LSP CONFIGURATIONS FOR DIFFERENT SERVERS USING lspconfig !!!
        lspconfig["pyright"].setup({ -- python LSP
            capabilities = cmp_capabilities,
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                        disableTaggedHints = true,
                    }
                }
            }
        })
        lspconfig["fortls"].setup({ -- fortran LSP
            capabilities = cmp_capabilities,
            on_attach = on_attach,
        })

    end,
}
