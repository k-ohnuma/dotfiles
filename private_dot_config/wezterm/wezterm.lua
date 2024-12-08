local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- font
local FONTS = {
  "Bizin Gothic NF",
  { family = "Moralerspace Neon NF" },
  "Monaco Nerd Font",
  { family = "Moralerspace Xenon NF" },
  { family = "Moralerspace Xenon NF", weight = "Bold" },
  { family = "HackGen Console NF", weight = "Bold" },
  "Monaco Nerd Font Mono",
  "CodeNewRoman Nerd Font Mono",
  "SaurceCodePro Nerd Font Mono",
  "Noto Nerd Font Mono",
  "Hack Nerd Font Mono",
}
config.font = wezterm.font_with_fallback(FONTS)
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- フォントサイズ
config.font_size = 15
config.window_decorations = "RESIZE"

-- color scheme
local COLOR_SCHEME = "Tokyo Night Moon"
config.color_scheme = COLOR_SCHEME
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.93
config.macos_window_background_blur = 0

config.adjust_window_size_when_changing_font_size = true
-- これ設定しないとバックスラッシュがうまくいかん
config.send_composed_key_when_left_alt_is_pressed = true

-- leader key(悩み中, tmuxで使ってた<C-g>telescopeとconflictする)
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
-- キーバインド
config.keys = {
  {
    key = "¥",
    action = wezterm.action.SendKey({ key = "\\" }),
  },
  {
    key = "+",
    mods = "CMD|SHIFT",
    action = wezterm.action.IncreaseFontSize,
  },
  -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  -- ⌘ Ctrl ,で下方向にペイン分割
  {
    key = ",",
    mods = "CMD|CTRL",
    action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  -- ⌘ Ctrl .で右方向にペイン分割
  {
    key = ".",
    mods = "CMD|CTRL",
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },
  -- ⌘ Ctrl oでペインの中身を入れ替える
  {
    key = "o",
    mods = "CMD|CTRL",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  {
    key = "h",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "h",
    mods = "CMD|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Left", 2 }),
  },
  {
    key = "j",
    mods = "CMD|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Down", 2 }),
  },
  {
    key = "k",
    mods = "CMD|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Up", 2 }),
  },
  {
    key = "l",
    mods = "CMD|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Right", 2 }),
  },
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
}

key_tables = {
  copy_mode = {
    { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
    { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
    { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
    { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
    -- 最初と最後に移動
    { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
    { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
    -- 左端に移動
    { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
    { key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
    { key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
    --
    { key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
    -- 単語ごと移動
    { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
    { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
    { key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
    -- ジャンプ機能 t f
    { key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
    { key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
    { key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
    { key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
    -- 一番下へ
    { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
    -- 一番上へ
    { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
    -- viweport
    { key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
    { key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
    { key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
    -- スクロール
    { key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
    { key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
    { key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
    { key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
    -- 範囲選択モード
    { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
    { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
    { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
    { key = "y", mods = "NONE", action = act.CopyTo("Clipboard") },
    {
      key = "Enter",
      mods = "NONE",
      action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
    },
    { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    { key = "c", mods = "CTRL", action = act.CopyMode("Close") },
    { key = "q", mods = "NONE", action = act.CopyMode("Close") },
  },
}

-- マウス操作の挙動設定
config.mouse_bindings = {
  -- 右クリックでクリップボードから貼り付け
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.CopyTo("Clipboard"),
  },
}

-- タブを下に表示（デフォルトでは上にある）
config.tab_bar_at_bottom = false

return config
