-- provides auto-completion capabilities via a completion engine
-- completions for specific purposes are 'sourced' from external repositories
-- we also add LuaSnip as a snippet engine to serve snippet auto-completes
-- lastly, we add LSP capabilities to this config
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load only when going into insert mode
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- cmp completion source for NVIM LSP related functionalities
        "hrsh7th/cmp-buffer", -- cmp completion source for text in current open buffer
        "hrsh7th/cmp-path", -- cmp completion source for paths in the file system
        "L3MON4D3/LuaSnip", -- snippet engine written in Lua
        "saadparwaiz1/cmp_luasnip", -- cmp completion source for serving code snippets
        "rafamadriz/friendly-snippets", -- set of useful snippets for various different languages
    },
    config = function ()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- load vscode style snippets using installed plugin snippets, e.g. from friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load() -- lazy load to avoid slow startup

        -- run nvim-cmp setup, including options for interaction with native
        -- NVIM completion functionalities and snippet engine functionalities
        -- (i.e. by passing to LuaSnip)
        -- also sets extra keymaps to be used inside nvim-cmp
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- keymaps
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- select previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- select next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- go backwards and forwards in preview window
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
            }),
            -- activate sources for autocompletion
            -- Note: order of sources does denote priority of recommendations
            sources = cmp.config.sources({
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
        })
    end,
}
