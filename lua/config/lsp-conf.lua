-- function to run upon server attaching to a buffer
local on_lsp_attach = function(args)
    -- read in LSP client name and buffer number
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    -- LSP shortcuts
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",
        { buffer = bufnr, desc = "Show LSP references", noremap = true, silent = true })                         -- show definition, references
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
        { buffer = bufnr, desc = "Go to declaration", noremap = true, silent = true })                           -- go to declaration
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
        { buffer = bufnr, desc = "Show LSP definitions", noremap = true, silent = true })                        -- show lsp definitions
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
        { buffer = bufnr, desc = "Show LSP implementations", noremap = true, silent = true })                    -- show lsp implementations
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
        { buffer = bufnr, desc = "Show LSP type definitions", noremap = true, silent = true })                   -- show lsp type definitions
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
        { buffer = bufnr, desc = "Show available code actions", noremap = true, silent = true })                 -- show available code actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
        { buffer = bufnr, desc = "Smart rename", noremap = true, silent = true })                                -- smart rename
    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
        { buffer = bufnr, desc = "Show buffer diagnostics", noremap = true, silent = true })                     -- Show buffer diagnostics
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
        { buffer = bufnr, desc = "Show line diagnostics", noremap = true, silent = true })                       -- Show line diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
        { buffer = bufnr, desc = "Go to previous diagnostic", noremap = true, silent = true })                   -- Jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
        { buffer = bufnr, desc = "Go to next diagnostic", noremap = true, silent = true })                       -- Jump to previous diagnostic in buffer
    vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { buffer = bufnr, desc = "Show documentation for what is under cursor", noremap = true, silent = true }) -- show docs for what is under cursor
    vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>",
        { buffer = bufnr, desc = "Restart LSP", noremap = true, silent = true })                                 -- restart LSP
end

-- create LspAttach autocommand to trigger on_lsp_attach everytime a server
-- attaches
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('MyLspConfig', { clear = true }),
    callback = on_lsp_attach,
})

-- change the diagnostic signals for certain LSP elements
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- local signs = { Error = "⮾ ", Warn = "⚠ ", Hint = "ⓘ ", Info = "🛈 "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Custom server configurations if needed.
vim.lsp.config("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                disableTaggedHints = true,
            }
        }
    }
})

-- Activation of different language servers
vim.lsp.enable({ "lua_ls", "pyright", "julials", "fortls", "clangd",
    "rust_analyzer", "bashls", "cmake" })
