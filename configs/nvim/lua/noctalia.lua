local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#010409",
    base01 = "#161b22",
    base02 = "#1e252e",
    base03 = "#515c67",
    base04 = "#8b949e",
    base05 = "#c9d1d9",
    base06 = "#c9d1d9",
    base07 = "#c9d1d9",
    base08 = "#f85149",
    base09 = "#bc8cff",
    base0A = "#bc8cff",
    base0B = "#d55149",
    base0C = "#b580ff",
    base0D = "#e99b96",
    base0E = "#b580ff",
    base0F = "#8e0700",
  })

  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "FoldColumn",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["noctalia"] = nil
    require("noctalia").setup()
  end)
)

return M
