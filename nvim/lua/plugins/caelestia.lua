-- ~/.config/nvim/lua/plugins/caelestia.lua
return {
  -- 1. Disable default themes
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  -- 2. Configure Transparent.nvim
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'NormalFloat', 'FloatBorder',
          'NeoTreeNormal', 'NeoTreeNormalNC', 'StatusLine', 'StatusLineNC',
          'WinSeparator', 'VertSplit',
        },
      })
    end
  },

  -- 3. Caelestia Integration & Auto-Reloader
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "caelestia", -- Tell LazyVim to use our theme
    },
  },
  
  -- 4. The Watcher Logic (This makes it dynamic)
  {
    "caelestia-watcher",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1001,
    config = function()
      local uv = vim.uv or vim.loop
      local config_path = vim.fn.stdpath("config")
      local colors_file = config_path .. "/lua/caelestia_colors.lua"

      -- Function to reload colors
      local function reload_colors()
        -- 1. Clear the cached version of the colors file
        package.loaded["caelestia_colors"] = nil
        
        -- 2. Reload the colorscheme safely
        vim.schedule(function()
          vim.cmd("colorscheme caelestia")
          -- Optional: Notify user (uncomment if you want to see a message)
          -- vim.notify("Caelestia colors reloaded", vim.log.levels.INFO)
        end)
      end

      -- Create a file system watcher
      local w = uv.new_fs_event()
      
      -- Start watching the file for changes
      w:start(colors_file, {}, function()
        reload_colors()
      end)
    end,
  }
}
