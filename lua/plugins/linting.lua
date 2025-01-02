return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        -- set up which linters to use for which type of files
        -- NOTE: Ruff LSP already provides linting capabilities -> does not need to be duplicated
        lint.linters_by_ft = {
            python = {"ruff"},
        }

       -- set up autocommand to trigger linting under certain events
       local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true }) -- create group
       
       vim.api.nvim_create_autocmd({"BufWritePost"}, {
           group = lint_augroup,
           callback = function()
               lint.try_lint() -- try linting
           end
       }) -- add events to trigger linting

       -- add keymap to trigger linting manually
       vim.keymap.set("n", "<leader>l", function()
           lint.try_lint()
       end, { desc = "Trigger linting for current file" })

    end,
}
