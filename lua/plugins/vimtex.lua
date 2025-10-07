return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.tex_favor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_compiler_progname = "nvr"
      -- 依 OS 切換 viewer
      local sys = vim.loop.os_uname().sysname
      if sys == "Darwin" then
        -- macOS: Skim
        -- 需安裝 Skim，偏好設定 > Sync 勾選 PDF-TeX Sync
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
        vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
        vim.g.vimtex_view_skim_activate = 1
        -- 反向搜尋（Skim 點選文字跳回 Neovim）會自動使用 nvr，如需可指定：
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_reading_bar = 1
      elseif sys == "Linux" then
        -- Linux: Zathura（支援 SyncTeX，建議安裝 python 的 neovim-remote: pip install neovim-remote）
        vim.g.vimtex_general_viewer = "zathura"
        vim.g.vimtex_view_method = "zathura"
        -- 若你偏好 Okular，改成：
        -- vim.g.vimtex_view_method = "okular"
      elseif sys == "Windows_NT" then
        -- Windows: SumatraPDF
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
        -- 使用 SyncTeX 反向搜尋需要設定命令；建議搭配 nvr（pip install neovim-remote）
        -- 將 nvr.exe 放在 PATH 後可使用以下參數（請視實際安裝路徑調整）：
        vim.g.vimtex_view_general_options = [[ -reuse-instance -forward-search @tex @line @pdf ]]
        -- 若要明確指定反向搜尋命令，可在 SumatraPDF 設定：
        -- "C:\Path\to\nvr.exe" --remote-silent +"%l %f"
      else
        -- 預設嘗試 Zathura
        vim.g.vimtex_view_method = "zathura"
      end
    end,
  },
}
