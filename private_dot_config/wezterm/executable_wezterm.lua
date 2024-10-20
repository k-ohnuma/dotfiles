local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}



if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.default_prog = { "wsl.exe", "--distribution", "ubuntu", "--cd", "~" }
config.default_domain = 'WSL:Ubuntu'
local FONTS = {
  "Monaco Nerd Font",
  "CodeNewRoman Nerd Font Mono",
  "SaurceCodePro Nerd Font Mono",
  "Noto Nerd Font Mono",
  "Hack Nerd Font Mono",
}
config.font = wezterm.font_with_fallback(FONTS)
-- フォントサイズ
config.font_size = 10.5
config.window_decorations = "RESIZE"

-- color scheme
local COLOR_SCHEME = "Tokyo Night Moon"
config.color_scheme = COLOR_SCHEME
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.85
-- leader key(悩み中, tmuxで使ってた<C-g>telescopeとconflictする)
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
-- キーバインド
config.keys = {
    {
        key = "¥",
        action = wezterm.action.SendKey { key = '\\' }
    },
    {
        key = "+",
        mods = "SHIFT|CTRL",
        action = wezterm.action.IncreaseFontSize,
    },
    -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
    {
        key = "w",
        mods = "CTRL",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- ⌘ Ctrl oでペインの中身を入れ替える
    {
        key = "o",
        mods = "CTRL",
        action = wezterm.action.RotatePanes 'Clockwise'
    },
    -- ⌘ Ctrl hjklでペインの移動
    {
        key = 'h',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'l',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    -- ⌘ Ctrl Shift hjklでペイン境界の調整
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Left', 2 },
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Down', 2 },
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Up', 2 },
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Right', 2 },
    },
    {
        key = '\\',
        mods = "LEADER",
        action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
    },
    {
        key = '-',
        mods = "LEADER",
        action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
    },
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
    -- { key = "c", mods = "CTRL", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
    { key = "1", mods = "CTRL", action = act.ActivateTab(0) },
    { key = "2", mods = "CTRL", action = act.ActivateTab(1) },
    { key = "3", mods = "CTRL", action = act.ActivateTab(2) },
    { key = "4", mods = "CTRL", action = act.ActivateTab(3) },
    { key = "5", mods = "CTRL", action = act.ActivateTab(4) },
    { key = "6", mods = "CTRL", action = act.ActivateTab(5) },
    { key = "7", mods = "CTRL", action = act.ActivateTab(6) },
    { key = "8", mods = "CTRL", action = act.ActivateTab(7) },

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
     -- { key = "c", mods = "CTRL", action = act.CopyMode("Close") },
     { key = "q", mods = "NONE", action = act.CopyMode("Close") },
   },
 }

-- マウス操作の挙動設定
config.mouse_bindings = {
    -- 右クリックでクリップボードから貼り付け
    {
        event = { Down = { streak = 1, button = 'Right' } },
        mods = 'NONE',
        action = wezterm.action.PasteFrom 'Clipboard',
    },
}

-- タブを下に表示（デフォルトでは上にある）
config.tab_bar_at_bottom = false

return config
