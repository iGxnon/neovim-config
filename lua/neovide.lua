vim.cmd([[ if exists("g:neovide")
  let g:neovide_transparency = 0.0
  let g:transparency = 0.8
  let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
  let g:neovide_input_macos_alt_is_meta = v:true
  let g:neovide_cursor_vfx_mode = "railgun"
  let g:neovide_input_use_logo = v:true
  let g:neovide_remember_window_size = v:false
  set guifont=Hack:h21
endif
]])
