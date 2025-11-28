-- juliana theme, an adaptation of the sublime text editor Mariana theme
-- I make some of my own adaptions to the syntax highlighting below
return {
    "kaiuri/nvim-juliana",
    priority=1000,
    config = function()
        -- create a callback function so these adaptions are made as soon
        -- as the colorscheme is loaded
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "@comment", { fg = "#a6acb9", italic = true })
                vim.api.nvim_set_hl(0, "@string", { fg = "#99c794" })
                vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#ec5f66" })
                vim.api.nvim_set_hl(0, "@variable.member", { fg = "#ec5f66" })
                vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#f9ae58" })
                vim.api.nvim_set_hl(0, "@boolean", { fg = "#ec5f66" })
                vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#5c99d6", italic = false })
                vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary", { italic = false })
                vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { italic = false })
                vim.api.nvim_set_hl(0, "@lsp.type.function.c", { fg = "#5c99d6", italic = false })
                vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#f9ae58" })
                vim.api.nvim_set_hl(0, "@markup.heading", { fg = "#ec5f66", bold = true })
                vim.api.nvim_set_hl(0, "@keyword.function.python", { fg = "#c695c6" })
            end,
        })
    end,
}
