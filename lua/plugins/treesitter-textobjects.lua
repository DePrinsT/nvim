-- syntax-aware treesitter textobjects
-- includes selecting, swapping and moving
-- Note: not all textobjects are supported by all languages
return  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- configure support for textobjects to treesitter
            textobjects = {
                -- support for selecting in visual mode
                select = {
                    enable = true,
                    lookahead = true, -- allow automatic jumps to textobject
                    keymaps = {
                        -- note, these keymaps only activat in visual mode
                        -- you can use the capture groups defined in textobjects.scm
                        ["a="] = { query = "@assignment.outer", desc= "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc= "Select inner part of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc= "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc= "Select right hand side of an assignment" },

                        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                        ["am"] = { query = "@function.outer", desc = "Select outer part of a function definition" },
                        ["im"] = { query = "@function.inner", desc = "Select inner part of a function definition" },

                        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                    },
                },
                --  support for swapping textobjects
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>na"] = "@parameter.inner", -- swap with next argument/parameter
                        ["<leader>nm"] = "@function.outer", -- swap function with next
                    },
                    swap_previous = {
                        ["<leader>pa"] = "@parameter.inner", -- swap with previous argument/parameter
                        ["<leader>pm"] = "@function.outer", -- swap function with previous
                    },
                },
                -- support for moving to textobjects
                move = {
                    enable = true,
                    set_jumps = true, -- whether to add jumps to the jumplist
                    goto_next_start = {
                        ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                        ["]m"] = { query = "@function.outer", desc = "Next function/method definition start" },
                        ["]c"] = { query = "@class.outer", desc = "Next class definition start" },
                        ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                        -- you can pass any type of query from the `queries/<lang>/<query_group>.scm` file
                        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@call.outer", desc = "Next function call end" },
                        ["]M"] = { query = "@function.outer", desc = "Next function/method definition end" },
                        ["]C"] = { query = "@class.outer", desc = "Next class definition end" },
                        ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },

                        -- you can pass any type of query from the `queries/<lang>/<query_group>.scm` file
                        ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                },
            },
        })
    end,
}
