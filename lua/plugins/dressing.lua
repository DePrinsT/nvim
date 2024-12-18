-- Makes for much nicer UI than the default for vim.ui.input and vim.ui.select.
-- These are UI hooks used by plugins when asking for user input (i.e. like an LSP
-- asking for a new name of a variable).
return {
    "stevearc/dressing.nvim",
    event = "VeryLazy", -- load this plugin later only when called upon
}
