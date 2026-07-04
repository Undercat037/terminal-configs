local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#1a1a1a",
    base01 = "#080808",
    base02 = "#121212",
    base03 = "#726358",
    base04 = "#f0ebe6",
    base05 = "#ffdacc",
    base06 = "#ffdacc",
    base07 = "#ffdacc",
    base08 = "#ffa0a0",
    base09 = "#f0e68c",
    base0A = "#ffa247",
    base0B = "#d06666",
    base0C = "#f0e68e",
    base0D = "#e99696",
    base0E = "#ffbf80",
    base0F = "#ec0000",
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
