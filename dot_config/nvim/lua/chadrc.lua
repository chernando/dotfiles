-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_light",

  changed_themes = {
    github_light = {
      base_30 = {
        grey_fg = "#8087a2"
      },
    },
  },

  statusline = {
    separator_style = "round",
  },

}

return M
