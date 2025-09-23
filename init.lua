---- silencing stupid LSP deprecated warnings for now
---- NOTE: might have to update this later
---- Silence the specific position encoding message
--local notify_original = vim.notify
--vim.notify = function(msg, ...)
--  if
--    msg
--    and (
--      msg:match 'vim.lsp.util.jump_to_location is deprecated. Run ":checkhealth vim.deprecated" for more information'
--      or msg:match 'Defaulting to position encoding of the first client'
--      or msg:match 'multiple different client offset_encodings'
--    )
--  then
--    return
--  end
--  return notify_original(msg, ...)
--end

-- load in Lazy package manager and all plugins
require("config.lazy")
-- load in other neovim configurations
require("config.vim-conf")
-- load in LSP configurations
require("config.lsp-conf")
