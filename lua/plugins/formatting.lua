return {
    "stevearc/conform.nvim",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        local conform = require("conform")

        -- set up which formatters to use for which type of files
        conform.setup({
            -- define formatters
            formatters_by_ft = {
                python = {"ruff_format"}, -- ruff formatter subcommand
                fortran = {"findent"},
            },
            format_on_save = {
                lsp_fallback = true, -- if formatter not available -> use LSP
                async = false,
                timeout_ms = 500,
            }
        })

        -- set some keybindings
        -- in normal mode applies to the whole file, in visual mode only to selection
        vim.keymap.set({"n", "v"}, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                asyc = false,
                timeout_ms = 50
            })
        end, {desc = "Format file or range (in visual mode)"})
    end,
}
