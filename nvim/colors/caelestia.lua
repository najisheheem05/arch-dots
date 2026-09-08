-- ~/.config/nvim/colors/caelestia.lua

-- 1. Standard Neovim boilerplate to clear existing themes
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "caelestia"

-- 2. Try to load the generated colors
local status, c = pcall(require, "caelestia_colors")

if not status then
  print("Caelestia colors not found. Using default.")
  return
end

-- 3. Helper function
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- 4. Apply Highlights (The same logic you had before)
-- UI Elements
hl("Normal",       { fg = c.foreground, bg = "NONE" }) -- Transparent
hl("NormalFloat",  { fg = c.foreground, bg = "NONE" })
hl("Cursor",       { bg = c.cursor, fg = c.background })
hl("CursorLineNr", { fg = c.cursor, bold = true })
hl("LineNr",       { fg = c.line_nr })
hl("Visual",       { bg = c.selection })
hl("Search",       { bg = c.cursor, fg = c.background })
hl("IncSearch",    { bg = c.keyword, fg = c.background })
hl("StatusLine",   { fg = c.foreground, bg = "NONE" })
hl("StatusLineNC", { fg = c.line_nr, bg = "NONE" })
hl("WinSeparator", { fg = c.line_nr })

-- Syntax Highlighting
hl("Comment",      { fg = c.comment, italic = true })
hl("Constant",     { fg = c.const })
hl("String",       { fg = c.string })
hl("Character",    { fg = c.string })
hl("Number",       { fg = c.const })
hl("Boolean",      { fg = c.const })
hl("Identifier",   { fg = c.foreground })
hl("Function",     { fg = c.func, bold = true })
hl("Statement",    { fg = c.keyword })
hl("Conditional",  { fg = c.keyword })
hl("Repeat",       { fg = c.keyword })
hl("Operator",     { fg = c.foreground })
hl("Type",         { fg = c.type })
hl("StorageClass", { fg = c.keyword })
hl("Special",      { fg = c.func })
hl("Delimiter",    { fg = c.foreground })
hl("@variable",    { fg = c.foreground })

-- Plugin Specifics
hl("NeoTreeGitAdded",    { fg = c.string })
hl("NeoTreeGitModified", { fg = c.warn })
hl("NeoTreeGitDeleted",  { fg = c.error })
hl("DiagnosticError",    { fg = c.error })
hl("DiagnosticWarn",     { fg = c.warn })
hl("DiagnosticInfo",     { fg = c.func })
hl("DiagnosticHint",     { fg = c.keyword })
